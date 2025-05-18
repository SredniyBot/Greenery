package ru.greenery.greenery.service;

import org.springframework.stereotype.Service;
import ru.greenery.greenery.entity.Order;
import ru.greenery.greenery.entity.OrderStatus;
import ru.greenery.greenery.entity.Product;
import ru.greenery.greenery.entity.ProductInfo;
import ru.greenery.greenery.repos.OrderRepo;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {

    private final OrderRepo orderRepo;

    public OrderService(OrderRepo repo) {
        this.orderRepo = repo;
    }

    public Order createNewOrder(){
        Order order = new Order();
        order.setOrderStatus(OrderStatus.CART.toString());
        order.setDiscount(0);
        order.setCost(0);
        return orderRepo.save(order);
    }

    public void addProductToCart(Order cartOrder, ProductInfo productInfo) {
        List<ProductInfo> products=cartOrder.getProducts();
        for (int i=products.size()-1;i>=0;i--){
            if (products.get(i).getProduct().getLinkName().equals(productInfo.getProduct().getLinkName())){
                products.remove(i);
                break;
            }
        }
        products.add(productInfo);
        cartOrder.setProducts(products);
        cartOrder.recalculateCost();
        orderRepo.save(cartOrder);
    }

    public void deleteProductFromCart(Order cartOrder, Product product) {
        List<ProductInfo> products=cartOrder.getProducts();
        for (int i=products.size()-1;i>=0;i--){
            if (products.get(i).getProduct().getLinkName().equals(product.getLinkName())){
                products.remove(i);
                break;
            }
        }
        cartOrder.recalculateCost();
        orderRepo.save(cartOrder);
    }

    public void increaseProductInCart(Order cartOrder, Product product) {
        List<ProductInfo> products=cartOrder.getProducts();
        for (int i=products.size()-1;i>=0;i--){
            if (products.get(i).getProduct().getLinkName().equals(product.getLinkName())){
                products.get(i).setQuantity(products.get(i).getQuantity()+1);
                break;
            }
        }
        cartOrder.recalculateCost();
        orderRepo.save(cartOrder);
    }

    public void decreaseProductInCart(Order cartOrder, Product product) {
        List<ProductInfo> products=cartOrder.getProducts();
        for (int i=products.size()-1;i>=0;i--){
            if (products.get(i).getProduct().getLinkName().equals(product.getLinkName())){
                products.get(i).setQuantity(products.get(i).getQuantity()-1);
                if(products.get(i).getQuantity()==0){
                    deleteProductFromCart(cartOrder, product);
                    return;
                }
                break;
            }
        }
        cartOrder.recalculateCost();
        orderRepo.save(cartOrder);
    }
}
