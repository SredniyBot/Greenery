package ru.greenery.greenery.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String orderStatus;

    private int discount;

    private int cost;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<ProductInfo> products;

    public OrderStatus getTrueOrderStatus() {
        return OrderStatus.valueOf(orderStatus);
    }

    public void setTrueOrderStatus(OrderStatus orderStatus) {
        this.orderStatus=orderStatus.name();
    }

    public void addProduct(ProductInfo productInfo){
        products.add(productInfo);
    }

    public void setProducts(List<ProductInfo> products){
        this.products=products;
        recalculateCost();
    }

    public void recalculateCost() {
        cost=0;
        for (ProductInfo productInfo :products){
            cost+=productInfo.getQuantity()*productInfo.getProduct().getCost();
        }
    }
}
