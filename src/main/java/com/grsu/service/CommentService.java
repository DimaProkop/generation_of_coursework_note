package com.grsu.service;

import com.grsu.entity.Comment;
import org.springframework.data.domain.Sort;

import java.util.List;

/**
 * Created by dionp on 19.04.2016.
 */
public interface CommentService {

    Comment addComment(Comment comment);
    void delete(Long id);
    Comment editComment(Comment comment);
    List<Comment> getAll();

}
