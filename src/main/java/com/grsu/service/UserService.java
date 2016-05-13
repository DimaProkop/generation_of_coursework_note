package com.grsu.service;

import com.grsu.entity.User;

import java.util.List;

/**
 * Created by dionp on 09.04.2016.
 */
public interface UserService {

    void addUser(User user);
    void delete(Long id);
    User editUser(User user);
    List<User> getAll();
    User getById(Long id);
    User findByLogin(String login);
}
