package com.fooddelivery.model;

import java.sql.Timestamp;

public class Orders {

    private int orderId;
    private int userId;
    private double totalAmount;
    private String orderStatus;
    private String paymentMethod;
    private Timestamp orderDate;

    // Default Constructor
    public Orders() {
    }

    // Parameterized Constructor (without orderId and orderDate)
    public Orders(int userId, double totalAmount, String orderStatus, String paymentMethod) {
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
    }

    // Parameterized Constructor (with all fields)
    public Orders(int orderId, int userId, double totalAmount, String orderStatus,
                  String paymentMethod, Timestamp orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
        this.orderDate = orderDate;
    }

    // Getters and Setters

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Orders [orderId=" + orderId +
                ", userId=" + userId +
                ", totalAmount=" + totalAmount +
                ", orderStatus=" + orderStatus +
                ", paymentMethod=" + paymentMethod +
                ", orderDate=" + orderDate + "]";
    }
}