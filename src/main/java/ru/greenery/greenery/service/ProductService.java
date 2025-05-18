package ru.greenery.greenery.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.greenery.greenery.entity.Product;
import ru.greenery.greenery.repos.ProductRepo;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    private final ProductRepo productRepo;
    private final FileService fileService;

    public ProductService(ProductRepo productRepo, FileService fileService) {
        this.productRepo = productRepo;
        this.fileService = fileService;
    }

    public List<Product> getAllProducts(){
        return productRepo.findAll();
    }

    public Product addNewProduct(Product product, MultipartFile ... files) throws Exception {
        List<String> productImages = new ArrayList<>();
        for (MultipartFile file:files){
            if (file!=null&&!file.getOriginalFilename().isEmpty()){
                productImages.add(fileService.createFileAndGetName(file));
            }
        }
        product =productRepo.save(product);
        product.setProductImages(productImages);
        return productRepo.save(product);
    }

    public Product getProductByLink(String prod) {
        return productRepo.findProductByLinkName(prod);
    }
}
