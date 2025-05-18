package ru.greenery.greenery.controller;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.greenery.greenery.entity.User;
import ru.greenery.greenery.service.UserService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Controller
public class RegistrationController {

    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signup")
    public String registration(){
        return "signup";
    }

    @PostMapping("/signup")
    public String registrarUser(@Valid User user,  BindingResult bindingResult, Model model,RedirectAttributes redirectAttributes){
        Map<String,String> errors=addUserOrGetErrors(user,bindingResult);
        if(errors.isEmpty()){
            redirectAttributes.addFlashAttribute("email",user.getEmail());
            redirectAttributes.addFlashAttribute("message","Подтвердите почту прежде чем продолжить");
            return "redirect:/login";
        }
        model.mergeAttributes(errors);
        model.addAttribute("email",user.getEmail());
        return "signup";
    }

    @GetMapping("/signup/{uuid}")
        public String activateUser(@PathVariable String uuid, @RequestParam String email,RedirectAttributes redirectAttributes){
        if(userService.activateUser(uuid)){
            redirectAttributes.addFlashAttribute("message","Пользователь успешно активирован");
        }else {
            redirectAttributes.addFlashAttribute("message","Пользователь уже был активирован, или его не существует");
        }
        if (email!=null){
            redirectAttributes.addFlashAttribute("email",email);
        }
        return "redirect:/login";
    }


    @GetMapping("/login-error")
    public String showErrors(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);
        String errorMessage = null;
        if (session != null) {
            AuthenticationException ex = (AuthenticationException) session
                    .getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
            if (ex != null) {
                errorMessage = ex.getMessage();
                if(errorMessage.equals("Пользователь отключен"))errorMessage="Пользователь не активирован, проверьте вашу почту";
            }
        }
//        model.addAttribute("email",)
        model.addAttribute("errorMessage", errorMessage);
        return "login";
    }


    @GetMapping("/restore")
    public String restore(){
        return "restore";
    }

    @PostMapping("/restore")
    public String sendRestore(@RequestParam String email,Model model){
        Map<String,String> errors=userService.sendRestoreCode(email);
        if (errors.isEmpty()){
            model.addAttribute("message","Письмо отправлено вам на почту");
        }else {
            model.mergeAttributes(errors);
        }
        return "restore";
    }

    @GetMapping("/restore/{uuid}")
    public String restorePasswordShow(@PathVariable String uuid,Model model,RedirectAttributes redirectAttributes){
        User u = userService.getUserByRestoreCode(uuid);
        if (u==null){
            redirectAttributes.addFlashAttribute("message","Данный код недействителен");
            return "redirect:/restore";
        }
        model.addAttribute("uuid",uuid);
        return "restorepswd";
    }

    @PostMapping("/restore/user")
    public String restorePassword(@RequestParam String uuid,@RequestParam String password,
                                  @RequestParam String passwordCheck, Model model,
                                  RedirectAttributes redirectAttributes){
        User u = userService.getUserByRestoreCode(uuid);
        if (u==null){
            redirectAttributes.addFlashAttribute("message","Данный код недействителен");
            return "redirect:/restore";
        }
        Map<String,String> errors=ControllerUtils.getPswdErrors(password, passwordCheck);
        if(!errors.isEmpty()){
            model.mergeAttributes(errors);
            model.addAttribute("uuid",uuid);
            return "restorepswd";
        }
        userService.renewPasswordForUser(u,password);
        redirectAttributes.addFlashAttribute("email",u.getEmail());
        return "redirect:/login";
    }



    private Map<String,String> addUserOrGetErrors(User user, BindingResult bindingResult) {
        Map<String,String> result=ControllerUtils.getErrorsFromBinding(bindingResult);
        result.putAll(ControllerUtils.getPswdErrors(user.getPassword(),user.getPasswordCheck()));
        if (result.isEmpty())result.putAll(userService.saveUserFirst(user));
        return result;
    }
}
