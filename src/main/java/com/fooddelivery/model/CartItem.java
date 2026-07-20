package com.fooddelivery.model;

public class CartItem {

    private int menuId;
    private String itemName;
    private double price;
    private int quantity;
    private String image;

    public CartItem() {}

    public CartItem(int menuId,
            String itemName,
            double price,
            int quantity,
            String image) {

this.menuId = menuId;
this.itemName = itemName;
this.price = price;
this.quantity = quantity;
this.image = image;
}

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return price * quantity;
    }
}