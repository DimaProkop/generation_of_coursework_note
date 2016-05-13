package com.grsu.service.impl;

import com.grsu.entity.User;
import com.grsu.repository.UserRepository;
import com.grsu.service.UserService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Override
    public void addUser(User user) {
         userRepository.saveAndFlush(user);

    }

    @Override
    public void delete(Long id) {
        userRepository.delete(id);
    }

    @Override
    public User editUser(User user) {
        return userRepository.saveAndFlush(user);
    }

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    public User getById(Long id) {
        return userRepository.findOne(id);
    }

    @Override
    public User findByLogin(String login) {

        for (User user:userRepository.findAll()) {
            if(user.getLogin().equals(login)){
                return  user;
            }
        }

        return  null;
    }
}
