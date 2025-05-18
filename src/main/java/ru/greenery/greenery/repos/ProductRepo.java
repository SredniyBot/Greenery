package ru.greenery.greenery.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.greenery.greenery.entity.Product;

public interface ProductRepo extends JpaRepository<Product,Long> {

    Product findProductByLinkName(String linkName);

}
