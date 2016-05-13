package com.grsu.service.impl;

import com.grsu.entity.Comment;
import com.grsu.repository.CommentRepository;
import com.grsu.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by dionp on 19.04.2016.
 */
@Service
public class CommentServiceImpl implements CommentService{


    @Autowired
    private CommentRepository commentRepository;

    @Override
    public Comment addComment(Comment comment) {
        return commentRepository.saveAndFlush(comment);
    }

    @Override
    public void delete(Long id) {
        commentRepository.delete(id);
    }

    @Override
    public Comment editComment(Comment comment) {
        return commentRepository.saveAndFlush(comment);
    }

    @Override
    public List<Comment> getAll() {
        return commentRepository.findAll();
    }
}
