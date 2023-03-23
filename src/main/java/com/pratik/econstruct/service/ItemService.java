package com.pratik.econstruct.service;

import java.util.List;

import com.pratik.econstruct.model.Item;

public interface ItemService {
    
    public List<Item> getAllItems();

    public Item getItemByName(String itemName);

    public void saveItem(Item item);

    public List<Item> getItemsByCategory(String category);

    public List<String> getCategories();

    public Item getItemById(long itemId);
}
