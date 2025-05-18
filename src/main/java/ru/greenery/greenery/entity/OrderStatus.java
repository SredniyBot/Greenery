package ru.greenery.greenery.entity;

public enum OrderStatus {

    DELIVERED("доставлен"),
    PAID("оплачен"),
    CART("в корзине");

    private String name;
    OrderStatus(String name){
        this.name=name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
