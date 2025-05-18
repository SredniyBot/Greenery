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
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String linkName;

    private int cost;

    private String shortDescription;
    private String cookDescription;
    private String healthDescription;
    private String storageDescription;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "product_image",joinColumns = @JoinColumn(name = "product_id"))
    private List<String> productImages;

    public String getMainImage(){
        return productImages.get(0);
    }

}
