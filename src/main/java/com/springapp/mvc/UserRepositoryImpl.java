package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Anton on 07.01.2015.
 */
public class UserRepositoryImpl implements UserRepositoryCustom {
    @Autowired
    private UserRepository userRepository;
    public List<User> findAllCustom() {
        return userRepository.findAll();
    }
}
