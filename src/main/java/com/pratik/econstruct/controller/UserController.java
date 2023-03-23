package com.pratik.econstruct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pratik.econstruct.model.User;
import com.pratik.econstruct.serviceImpl.UserServiceImpl;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {

    @Autowired
    UserServiceImpl userService;

    @RequestMapping("/")
    public String home(Model model){
        model.addAttribute("user", new User());
        return "index";
    }
    
    @PostMapping("/login")
    public String preLogin(@ModelAttribute("user") User user,Model model,HttpSession session){
        User loginUser=userService.getUserByUsername(user.getUsername());
        if(loginUser!=null && loginUser.getPassword().equals(user.getPassword())){
            model.addAttribute("message", "Login successful");

            session.setAttribute("loginUser", loginUser);
           
        return "forward:/home/"+loginUser.getUserType();            
        }
        model.addAttribute("message", "Incorrect username or password");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        session.invalidate();
        return "redirect:/";
    }


    @RequestMapping("/register")
    public String registerUser(Model model){
        
        model.addAttribute("user", new User());
        return "userRegister";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user,Model model){

        User checkUser=userService.getUserByUsername(user.getUsername());
        
        if(checkUser!=null){
            model.addAttribute("message", "User Already Exist");
            model.addAttribute("user", user);
            return "userRegister";
        }
        if(!user.getPassword().equals(user.getConfirmPassword())){
            model.addAttribute("message", "Password Not Matching");
            model.addAttribute("user", user);
            return "userRegister";
        }
        userService.saveUser(user);
        model.addAttribute("message", "Registration Successful.");
        return "index";
    }
}
