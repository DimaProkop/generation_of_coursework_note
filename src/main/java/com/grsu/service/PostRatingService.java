package com.grsu.service;

import com.grsu.entity.PostRating;

import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */
public interface PostRatingService {

    PostRating addPostRating(PostRating postRating);
    void delete(Long id);
    PostRating editPostRating(PostRating postRating);
    List<PostRating> getAll();

}
