package ru.greenery.greenery.controller;

import org.springframework.boot.Banner;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.greenery.greenery.entity.Product;
import ru.greenery.greenery.service.ProductService;

import javax.validation.Valid;

@Controller
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class AddProductController {

    private final ProductService productService;

    public AddProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product-add")
    public String showPage(){
        return "productAdd";
    }
    @PostMapping("/product-add")
    public String addProduct(@RequestParam(name = "image1" ) MultipartFile image1,
                             @RequestParam(name = "image2" ,required = false) MultipartFile image2,
                             @RequestParam(name = "image3" ,required = false) MultipartFile image3,
                             @Valid Product product, Model model){
        String link;
        try {
            link=productService.addNewProduct(product,image1,image2,image3).getLinkName();
        } catch (Exception e) {
            model.addAttribute("error",e);
            e.printStackTrace();
            return "productAdd";
        }
        return "redirect:/product/"+link;
    }

}
