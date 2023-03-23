package com.pratik.econstruct.service;

import com.pratik.econstruct.model.User;

public interface UserService {
    
    public User getUserByUsername(String username);

    public void saveUser(User user);

    
}
