package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.Orders;

public interface OrdersDAO {

    int addOrder(Orders order);

    Orders getOrderById(int orderId);

    List<Orders> getOrdersByUserId(int userId);

    boolean updateOrderStatus(int orderId, String status);

    boolean deleteOrder(int orderId);
}