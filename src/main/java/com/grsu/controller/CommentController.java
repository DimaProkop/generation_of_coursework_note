package com.grsu.controller;

import com.grsu.entity.Comment;
import com.grsu.entity.Post;
import com.grsu.service.CommentService;
import com.grsu.service.PostService;
import com.grsu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by dionp on 20.04.2016.
 */
@RestController
@RequestMapping(value = "/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    PostService postService;



    @RequestMapping(value = "/add/{id}", method = RequestMethod.POST)
    public ModelAndView addComment(@PathVariable("id") Long id,@RequestParam("text") String text){

        Comment comment = new Comment(text);

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername();


        com.grsu.entity.User userForComment;
        userForComment = userService.findByLogin(name);

        Post post = postService.getById(id);

        comment.setUser(userForComment);
        comment.setPost(post);


        commentService.addComment(comment);

        return  new ModelAndView("redirect:/comment/list/"+id+"");

    }


    @RequestMapping(value="/list/{id}", method = RequestMethod.GET)
    public ModelAndView listOfComments(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("post");

        Post answer = postService.getById(id);

        modelAndView.addObject("answer", answer);

        List<Comment> comments =answer.getComments();

        modelAndView.addObject("comments", comments);

        return modelAndView;
    }


}
