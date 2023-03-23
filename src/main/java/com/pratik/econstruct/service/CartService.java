package com.pratik.econstruct.service;

import java.util.List;

import com.pratik.econstruct.model.Cart;

public interface CartService {
    
    public void saveToCart(Cart cart);

    public List<Cart> getUserOrders(long userId);

    public void deleteOrder(long userId,long itemId);

    public List<Cart> getOrdersByUserIdAndItemId(long userId,long itemId);
}
