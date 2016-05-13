package com.grsu.controller;

import com.grsu.entity.Post;
import com.grsu.entity.PostRating;
import org.springframework.security.core.userdetails.User;

import com.grsu.service.PostRatingService;
import com.grsu.service.PostService;
import com.grsu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Random;

/**
 * Created by dionp on 10.04.2016.
 */

@RestController
@RequestMapping(value = "/post")
public class PostController {

    @Autowired
    PostService postService;

    @Autowired
    PostRatingService postRatingService;

    @Autowired
    UserService userService;

    @RequestMapping(value="/list/", method = RequestMethod.GET)
    public ModelAndView listOfPosts() {
        ModelAndView modelAndView = new ModelAndView("askall");

        List<Post> posts = postService.getAll();

        modelAndView.addObject("posts", posts);

        return modelAndView;
    }

    @RequestMapping(value="/answer/{id}", method = RequestMethod.GET)
    public ModelAndView getPost(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("post");

        Post answer = postService.getById(id);

        modelAndView.addObject("answer", answer);

        return modelAndView;
    }

    @RequestMapping(value="/add/", method = RequestMethod.GET)
    public ModelAndView getAddPostPage() {

        return new ModelAndView("addquestion");
    }

    @RequestMapping(value = "/add/", method = RequestMethod.POST)
    public ModelAndView createUser(@RequestParam("title") String title,
                                   @RequestParam("text") String text){

        ModelAndView modelAndView = new ModelAndView("redirect:/post/list/");

        Random randomRating = new Random();
        int value = randomRating.nextInt(100);

        PostRating postRating = new PostRating(value);


        Post post = new Post(title,text);


        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername();


        com.grsu.entity.User userForComment;
        userForComment = userService.findByLogin(name);

        post.setPostRating(postRating);
        post.setUser(userForComment);

        postService.addPost(post);

        return modelAndView;
    }

}
