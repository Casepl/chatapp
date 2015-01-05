package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Anton on 04.01.2015.
 */
public class DataManager {
    @Autowired
    private UserRepository userRepository;
    //find all users
    public List<User> AllUsers() {
        return userRepository.findAll();
    }
    //find user by id
    public User GetUserById(Long id){
        return userRepository.findOne(id);
    }
    //find user by e-mail
    public User GetUserByMail(){
        return user;
    }

}
