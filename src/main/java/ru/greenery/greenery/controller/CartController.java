package ru.greenery.greenery.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.greenery.greenery.entity.Product;
import ru.greenery.greenery.entity.ProductInfo;
import ru.greenery.greenery.entity.User;
import ru.greenery.greenery.service.ProductService;
import ru.greenery.greenery.service.UserService;

@Controller
@RequestMapping("/cart")
@PreAuthorize("hasAnyAuthority('USER')")
public class CartController {

    private final UserService userService;
    private final ProductService productService;

    public CartController(UserService userService, ProductService productService) {
        this.userService = userService;
        this.productService = productService;
    }

    @GetMapping
    public String showCart(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user",user);
        return "shopping-cart";
    }

    @PostMapping
    public String addProduct(@AuthenticationPrincipal User user,
                             @RequestParam(name = "product")String productLink,
                             @RequestParam(name = "productNumber") int productNumber){

        Product product = productService.getProductByLink(productLink);
        userService.addProductToCart(user,new ProductInfo(product,productNumber));

        return "redirect:/cart";
    }
    @PostMapping("/delete/{link}")
    public String delProduct(@AuthenticationPrincipal User user,
                             @PathVariable String link){

        Product product = productService.getProductByLink(link);
        userService.deleteProductFromCart(user,product);
        return "redirect:/cart";
    }

    @PostMapping("/plus/{link}")
    public String increaseProduct(@AuthenticationPrincipal User user,
                                  @PathVariable String link){

        Product product = productService.getProductByLink(link);
        userService.increaseProductInCart(user,product);
        return "redirect:/cart";
    }
    @PostMapping("/minus/{link}")
    public String decreaseProduct(@AuthenticationPrincipal User user,
                                  @PathVariable String link){

        Product product = productService.getProductByLink(link);
        userService.decreaseProductInCart(user,product);
        return "redirect:/cart";
    }
    @PostMapping("/commit/{link}")
    public String commit(@AuthenticationPrincipal User user){
        return "redirect:/cart";
    }

}
