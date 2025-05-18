package ru.greenery.greenery.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.greenery.greenery.entity.User;
import ru.greenery.greenery.service.UserService;

import java.util.Map;

@Controller
@RequestMapping("/profile")
@PreAuthorize("hasAnyAuthority('USER')")
public class ProfileController {

    private final UserService userService;

    public ProfileController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String getProfile(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("user",user);
        model.addAttribute("prevOrders",userService.getUserPrevOrders(user));
        return "profile";
    }

    @PostMapping("/status")
    public String setStatus(@AuthenticationPrincipal User user, @RequestParam(name = "notification") String notification){
//        user.setNotificationStatus();
        user.setNotificationStatus(notification);
        userService.saveUser(user);
        return "redirect:/profile";
    }

    @PostMapping("/phoneChange")
    public String setPhone(@AuthenticationPrincipal User user, @RequestParam(name = "telephone") String phone){
        user.setPhone(phone);
        userService.saveUser(user);
        return "redirect:/profile";
    }

    @GetMapping("/passwordReset")
    public String passwordReset(@AuthenticationPrincipal User user,Model model){
        model.addAttribute("user",user);
        return "restorepswd";
    }

    @PostMapping("/passwordReset")
    public String restorePassword(@AuthenticationPrincipal User user,@RequestParam String password,
                                  @RequestParam String passwordCheck, Model model,RedirectAttributes redirectAttributes){

        Map<String,String> errors=ControllerUtils.getPswdErrors(password, passwordCheck);
        if(!errors.isEmpty()){
            model.mergeAttributes(errors);
            model.addAttribute("user",user);
            return "restorepswd";
        }
        userService.renewPasswordForUser(user,password);
        redirectAttributes.addFlashAttribute("pswdMessage","Пароль успешно изменен");
        return "redirect:/profile";
    }
}
