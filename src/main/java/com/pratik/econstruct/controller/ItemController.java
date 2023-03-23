package com.pratik.econstruct.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pratik.econstruct.model.Cart;
import com.pratik.econstruct.model.Item;
import com.pratik.econstruct.model.User;
import com.pratik.econstruct.serviceImpl.CartServiceImpl;
import com.pratik.econstruct.serviceImpl.ItemServiceImpl;

import jakarta.servlet.http.HttpSession;



@Controller
public class ItemController {
    
    @Autowired
    ItemServiceImpl itemService;

    @Autowired
    CartServiceImpl cartService;

    @RequestMapping("/addItem")
    public String addItem(Model model){
        model.addAttribute("item", new Item());
        
        return "addItem";
    }

    @PostMapping("/saveItem")
    public String saveItem(@ModelAttribute("item") Item item,Model model){
        itemService.saveItem(item);
        model.addAttribute("message", "Item Added Successfully");
        return "success";
    }

    @RequestMapping("/home/{userType}")
    public String home(@PathVariable int userType,Model model){
        List<Item> itemList=itemService.getAllItems();
        List<String> categories=itemService.getCategories();
        model.addAttribute("itemList", itemList);
        model.addAttribute("categories", categories);
        if(userType==1)
            return "home";
        else
            return "userHome";
    }


    @RequestMapping("/getList/{category}")
    public String getItemList(@PathVariable String category,Model model,HttpSession session){
        User user=(User)session.getAttribute("loginUser");
        if(user==null){
            return "redirect:/";
        }

        List<Item> itemList=null;
        List<String> categories=itemService.getCategories();
        if(category!=null && category.equals("all")){
            itemList=itemService.getAllItems();
        }else{
            itemList=itemService.getItemsByCategory(category);
        }
        model.addAttribute("itemList", itemList);
        model.addAttribute("categories", categories);

        if(user.getUserType()==1)
            return "home";
        else
            return "userHome";
    }

    @RequestMapping("/addToCart")
    public String addToCart(@RequestParam("userId") long userId,@RequestParam("itemId") long itemId,HttpSession session,Model model){
        User user=(User)session.getAttribute("loginUser");
        if(user==null){
            return "redirect:/";
        }
        Item item=itemService.getItemById(itemId);
        int qty=item.getQuantity();
        if(qty==0){
            model.addAttribute("message", "Item Not Available");
            return "success";
        }

        Cart cart =new Cart();
        cart.setUserId(userId);
        cart.setItemId(itemId);
        cart.setQuantity(1);
        cartService.saveToCart(cart);

        
        item.setQuantity(item.getQuantity()-1);
        itemService.saveItem(item);
        model.addAttribute("message", "Item Added To Cart Successfully");
        return "success";
    }

    @RequestMapping("/cart")
    public String cart(Model model,HttpSession session){
        User loggedUser=(User)session.getAttribute("loginUser");
        if(loggedUser==null){
            return "redirect:/";
        }
        List<Cart> orders=cartService.getUserOrders(loggedUser.getUserId());
        
        Map<Long,Item> itemList=new HashMap<>();
     
        orders.stream().forEach(order->{
            Item item=null;
            if(itemList.containsKey(order.getItemId())){
                item=itemList.get(order.getItemId());
                item.setQuantity(item.getQuantity()+order.getQuantity());
            }else{
                item=itemService.getItemById(order.getItemId());
                item.setQuantity(order.getQuantity());
            }
            
            itemList.put(item.getItemId(), item);
        });
        List<String> categories=itemService.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("itemList", new ArrayList<>(itemList.values()));
        return "cart";
    }

    @RequestMapping("/remove")
    public String removeFromCart(@RequestParam("userId") long userId,@RequestParam("itemId") long itemId,HttpSession session){
        User loggedUser=(User)session.getAttribute("loginUser");
        if(loggedUser==null){
            return "redirect:/";
        }
        List<Cart> orders=cartService.getOrdersByUserIdAndItemId(userId, itemId);
        int qty=orders.stream().collect(Collectors.summingInt(Cart:: getQuantity));
       
        cartService.deleteOrder(userId, itemId);
        Item item=itemService.getItemById(itemId);
        item.setQuantity(item.getQuantity()+qty);
        itemService.saveItem(item);
        return "redirect:/cart";
    }

    
}
