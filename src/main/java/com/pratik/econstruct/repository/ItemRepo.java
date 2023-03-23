package com.pratik.econstruct.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pratik.econstruct.model.Item;

public interface ItemRepo extends JpaRepository<Item,Long>{
    
    public Item findByItemName(String itemName);

    public List<Item> findByCategory(String category);

    @Query("select distinct category from Item")
    public List<String> findAllCategories();
}
