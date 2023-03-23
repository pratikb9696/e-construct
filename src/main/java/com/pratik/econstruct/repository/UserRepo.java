package com.pratik.econstruct.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pratik.econstruct.model.User;

public interface UserRepo extends JpaRepository<User,Long>{
    
    public User findByUsername(String username);
}
