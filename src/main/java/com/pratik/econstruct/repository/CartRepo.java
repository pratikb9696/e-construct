package com.pratik.econstruct.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pratik.econstruct.model.Cart;

public interface CartRepo extends JpaRepository<Cart,Long>{
    
    public List<Cart> findByUserId(long userId);

    public void deleteByUserIdAndItemId(long userId,long itemId);

    public List<Cart> findByUserIdAndItemId(long userId,long itemId);
}
