package com.pratik.econstruct.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pratik.econstruct.model.Item;
import com.pratik.econstruct.repository.ItemRepo;
import com.pratik.econstruct.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService{

    @Autowired
    ItemRepo repo;

    @Override
    public List<Item> getAllItems() {
        return repo.findAll();
    }

    @Override
    public Item getItemByName(String itemName) {
        return repo.findByItemName(itemName);
    }

    @Override
    public void saveItem(Item item) {
        repo.save(item);
    }

    @Override
    public List<Item> getItemsByCategory(String category) {
        return repo.findByCategory(category);
    }

    @Override
    public List<String> getCategories() {
       return repo.findAllCategories();
    }

    @Override
    public Item getItemById(long itemId) {
       return repo.findById(itemId).get();
    }
    
}
