package com.pratik.econstruct.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pratik.econstruct.model.User;
import com.pratik.econstruct.repository.UserRepo;
import com.pratik.econstruct.service.UserService;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserRepo repo;

    @Override
    public User getUserByUsername(String username) {
        return repo.findByUsername(username);
    }

    @Override
    public void saveUser(User user) {
        repo.save(user);
    }
    
}
