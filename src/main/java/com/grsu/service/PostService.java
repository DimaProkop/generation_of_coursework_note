package com.grsu.service;

import com.grsu.entity.Post;

import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */
public interface PostService {

    Post addPost(Post post);
    void delete(Long id);
    Post editPost(Post post);
    List<Post> getAll();
    Post getById(Long id);
}
