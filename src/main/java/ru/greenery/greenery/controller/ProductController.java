package ru.greenery.greenery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.greenery.greenery.entity.Product;
import ru.greenery.greenery.service.BotService;
import ru.greenery.greenery.service.ProductService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final BotService botService;

    public ProductController(ProductService productService, BotService botService) {
        this.productService = productService;
        this.botService = botService;
    }


    @GetMapping("/products")
    public String getProducts(Model model){
        model.addAttribute("products",productService.getAllProducts());
        return "products";
    }

    @GetMapping("/product/{prod}")
    public String getProduct(@PathVariable String prod, Model model){
        Product product = productService.getProductByLink(prod);

        if(product!=null){
            model.addAttribute("product",product);
            for (int i=0;i<product.getProductImages().size();i++){
                model.addAttribute("image"+(i+1),product.getProductImages().get(i));
            }
        }
        return "product";
    }

    @PostMapping("/products")
    public String sendPraysToTg(@RequestParam(name = "name") String name, RedirectAttributes redirectAttributes){
        botService.sendPraysToMainChat(name);
        redirectAttributes.addFlashAttribute("message","Мы получили ваше сообщение!");
        return "redirect:/products";
    }
}
