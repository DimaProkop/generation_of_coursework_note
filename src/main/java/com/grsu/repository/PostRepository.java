package com.grsu.repository;

import com.grsu.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dionp on 09.04.2016.
 */
public interface PostRepository extends JpaRepository<Post, Long>{
}
