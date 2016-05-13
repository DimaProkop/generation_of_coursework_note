package com.grsu.controller;

import com.grsu.entity.PersonInfo;
import com.grsu.entity.User;
import com.grsu.service.PersonInfoService;
import com.grsu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */
@RestController
@RequestMapping (value = "/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    PersonInfoService personInfoService;

    @RequestMapping(value = "/add/", method = RequestMethod.GET)
    public ModelAndView createUser() {

//        PersonInfo personInfo = new PersonInfo("qwe","ewq","1995-06-06","dionp95@mail.ru");
//        personInfo = personInfoService.addPersonInfo(personInfo);

        User user = new User("slava","1111","CURATOR");
//        user.setPersonInfo(personInfo);


        userService.addUser(user);

        return new ModelAndView("/");

    }

    @RequestMapping(value = "/check/", method = RequestMethod.POST)
    public ModelAndView saveUser(@RequestParam("login") String login,
                                 @RequestParam("password") String password
    ) throws IOException {

        List<User> userList = null;
        try {
            userList = userService.getAll();
            for (User user :userList) {
                if (user.getLogin().equals(login) && user.getPassword().equals(password)){
                    return new ModelAndView("person-info");
                }
            }


            return new ModelAndView("login-error");


        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
