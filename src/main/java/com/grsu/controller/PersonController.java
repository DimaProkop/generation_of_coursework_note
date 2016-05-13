package com.grsu.controller;

import com.grsu.entity.GroupStudent;
import com.grsu.entity.Nationality;
import com.grsu.entity.PersonInfo;
import com.grsu.service.PersonInfoService;
import com.grsu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by dionp on 22.04.2016.
 */

@RestController
@RequestMapping(value = "/person")
public class PersonController {

    @Autowired
    PersonInfoService personInfoService;

    @Autowired
    UserService userService;


    @RequestMapping(value = "/pageEdit",method = RequestMethod.GET)
    public ModelAndView pageEdit(){
        return new ModelAndView("edit-profile");
    }

    @RequestMapping(value = "/add/", method = RequestMethod.POST)
    public ModelAndView addInfo(@RequestParam("name") String name,
                                   @RequestParam("surname") String surname,
                                   @RequestParam("birthday") String birthday,
                                   @RequestParam("email") String email){

        ModelAndView modelAndView = new ModelAndView("redirect:/person/profile/");
        User userAuth = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


        com.grsu.entity.User user;
        user = userService.findByLogin(userAuth.getUsername());

        PersonInfo personInfo = new PersonInfo(name,surname,birthday,email);

        user.setPersonInfo(personInfo);
        userService.editUser(user);


        return modelAndView;
    }

    @RequestMapping(value = "/edit/", method = RequestMethod.POST)
    public ModelAndView addInfo(@RequestParam("name") String name,
                                @RequestParam("surname") String surname,
                                @RequestParam("email") String email){

        ModelAndView modelAndView = new ModelAndView("redirect:/person/profile/");

        User userAuth = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


        com.grsu.entity.User user;
        user = userService.findByLogin(userAuth.getUsername());

        String birthday = user.getPersonInfo().getBirthday();

        PersonInfo personInfo = new PersonInfo(name,surname,birthday,email);


        personInfoService.editPersonInfo(personInfo);
        user.setPersonInfo(personInfo);

        userService.editUser(user);

        return modelAndView;
    }


    @RequestMapping(value="/profile/", method = RequestMethod.GET)
    public ModelAndView getPost() {
        ModelAndView modelAndView = new ModelAndView("profile");

        User userAuth = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = userAuth.getUsername();


        com.grsu.entity.User user;
        user = userService.findByLogin(name);


        modelAndView.addObject("user", user);


        return modelAndView;

    }

    @RequestMapping(value = "/addBio/", method = RequestMethod.POST)
    public ModelAndView addInfoBio(@RequestParam("nationality") String nationality,
                                @RequestParam("course") int course,
                                @RequestParam("number") String number){

        ModelAndView modelAndView = new ModelAndView("redirect:/person/profile/");
        User userAuth = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


        com.grsu.entity.User user;
        user = userService.findByLogin(userAuth.getUsername());

        Nationality nationality1 = new Nationality(nationality);

        PersonInfo personInfo = new PersonInfo(user.getPersonInfo().getName(),user.getPersonInfo().getSurname(),user.getPersonInfo().getBirthday(),user.getPersonInfo().getBirthday());
        personInfo.setNationality(nationality1);
        user.setPersonInfo(personInfo);

        userService.editUser(user);
        return modelAndView;
    }
}
