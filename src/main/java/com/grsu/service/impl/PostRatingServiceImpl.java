package com.grsu.service.impl;

import com.grsu.entity.PostRating;
import com.grsu.repository.PostRatingRepository;
import com.grsu.service.PostRatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */

@Service
public class PostRatingServiceImpl implements PostRatingService{


    @Autowired
    private PostRatingRepository postRatingRepository;

    @Override
    public PostRating addPostRating(PostRating postRating) {
        return postRatingRepository.saveAndFlush(postRating);
    }

    @Override
    public void delete(Long id) {
        postRatingRepository.delete(id);
    }

    @Override
    public PostRating editPostRating(PostRating postRating) {
        return postRatingRepository.saveAndFlush(postRating);
    }

    @Override
    public List<PostRating> getAll() {
        return postRatingRepository.findAll();
    }
}
