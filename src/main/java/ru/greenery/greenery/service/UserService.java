package ru.greenery.greenery.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import ru.greenery.greenery.entity.*;
import ru.greenery.greenery.repos.UserRepo;

import java.util.*;

@Component
public class UserService implements UserDetailsService {

    private final BCryptPasswordEncoder encoder;
    private final UserRepo userRepo;

    private final OrderService orderService;
    private final MailSender mailSender;

    UserService(BCryptPasswordEncoder encoder, UserRepo userRepo, OrderService orderService, MailSender mailSender){
        this.encoder = encoder;
        this.userRepo=userRepo;
        this.orderService = orderService;
        this.mailSender = mailSender;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = userRepo.findByEmail(username);
        if (u!=null) return u;
        else throw new UsernameNotFoundException("no user");
    }

    public Map<String,String> saveUserFirst(User user){
        Map<String,String> errors = new HashMap<>();
        if(emailExists(user.getEmail())){
            errors.put("emailError","Пользователь с такой почтой уже существует");
        }else {

            String uuid=UUID.randomUUID().toString();
            mailSender.sendHtml(user.getEmail(),"Активация пользователя",String.format(
                    """
                        <hr style="border: 10px solid #63b175;">
                        <h1 style="color: #2d2d2d; text-align: center;margin: 20px">Приветствуем вас в Greenery!</h1>
                        <hr style="border: 10px solid #63b175;">
                        <h5 style="color: #2d2d2d; text-align: center">Чтобы активировать ваш профиль перейдите по <a href="%s">ссылке</a> </h5>
                            """,
                    "http://127.0.0.1:8080/signup/"+uuid+"?email="+user.getEmail()));

            user.setActivationCode(uuid);
            user.setPassword(encoder.encode(user.getPassword()));
            user.setRoles(Set.of(Role.USER));
            user.setCartOrder(orderService.createNewOrder());
            userRepo.save(user);
        }
        return errors;
    }

    public boolean emailExists(String email){
        User u = userRepo.findByEmail(email);
        return u!=null;
    }

    public boolean activateUser(String uuid) {
        User u=userRepo.findByActivationCode(uuid);
        if (u==null)return false;
        u.setActive(true);
        u.setActivationCode(null);
        userRepo.save(u);
        return true;
    }

    public Map<String,String> sendRestoreCode(String email) {
        Map<String,String> errors=new HashMap<>();
        User user=userRepo.findByEmail(email);
        if(user==null){
            errors.put("emailError","Пользователя с такой почтой не существует");
            return errors;
        }
        String uuid=UUID.randomUUID().toString()+new Random().nextInt(100000);
        mailSender.sendHtml(user.getEmail(),"Восстановление пароля",String.format(
                """
                    <hr style="border: 10px solid #63b175;">
                    <h1 style="color: #2d2d2d; text-align: center;margin: 20px">С возвращением в Greenery!</h1>
                    <hr style="border: 10px solid #63b175;">
                    <h5 style="color: #2d2d2d; text-align: center">Для задания нового пароля перейдите по <a href="%s">ссылке</a> </h5>
                        """,
                "http://127.0.0.1:8080/restore/"+uuid));
        user.setRestoreCode(uuid);
        userRepo.save(user);
        return errors;
    }


    public User getUserByRestoreCode(String uuid){
        return userRepo.findByRestoreCode(uuid);
    }

    public void renewPasswordForUser(User u, String password) {
        u.setPassword(encoder.encode(password));
        u.setRestoreCode(null);
        u.setActivationCode(null);
        u.setActive(true);
        userRepo.save(u);
    }

    public void saveUser(User user) {
        userRepo.save(user);
    }

    @Transactional
    public void storeCurrentOrder(User user) {
        List<Order> prev= userRepo.findByEmail(user.getEmail()).getPrevOrders();
        prev.add(user.getCartOrder());
        user.setPrevOrders(prev);
        user.setCartOrder(orderService.createNewOrder());
        userRepo.save(user);
    }


    public void addProductToCart(User user,
                                 ProductInfo productInfo) {
        orderService.addProductToCart(user.getCartOrder(),productInfo);
    }

    public void deleteProductFromCart(User user, Product product) {
        orderService.deleteProductFromCart(user.getCartOrder(),product);
    }

    public void increaseProductInCart(User user, Product product) {
        orderService.increaseProductInCart(user.getCartOrder(),product);

    }

    public void decreaseProductInCart(User user, Product product) {
        orderService.decreaseProductInCart(user.getCartOrder(),product);

    }

    @Transactional
    public List<Order> getUserPrevOrders(User user) {
        return userRepo.findByEmail(user.getEmail()).getPrevOrders();
    }
}
