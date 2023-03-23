package com.pratik.econstruct.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pratik.econstruct.model.Cart;
import com.pratik.econstruct.repository.CartRepo;
import com.pratik.econstruct.service.CartService;

@Transactional
@Service
public class CartServiceImpl implements CartService{

    @Autowired
    CartRepo repo;

    @Override
    public void saveToCart(Cart cart) {
        repo.save(cart);
    }

    @Override
    public List<Cart> getUserOrders(long userId) {
        return repo.findByUserId(userId);
    }

    @Override
    public void deleteOrder(long userId, long itemId) {
        repo.deleteByUserIdAndItemId(userId, itemId);
    }

    @Override
    public List<Cart> getOrdersByUserIdAndItemId(long userId, long itemId) {
        return repo.findByUserIdAndItemId(userId, itemId);
    }
    
}
