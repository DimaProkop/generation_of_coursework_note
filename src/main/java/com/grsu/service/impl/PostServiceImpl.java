package com.grsu.service.impl;

import com.grsu.entity.Post;
import com.grsu.repository.PostRepository;
import com.grsu.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */

@Service
public class PostServiceImpl implements PostService{

    @Autowired
    private PostRepository postRepository;

    @Override
    public Post addPost(Post post) {
        return postRepository.saveAndFlush(post);
    }

    @Override
    public void delete(Long id) {
        postRepository.delete(id);
    }

    @Override
    public Post editPost(Post post) {
        return postRepository.saveAndFlush(post);
    }

    @Override
    public List<Post> getAll() {
        return postRepository.findAll();
    }

    @Override
    public Post getById(Long id) {
        return postRepository.findOne(id);
    }
}
