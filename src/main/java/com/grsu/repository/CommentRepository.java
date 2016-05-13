package com.grsu.repository;

import com.grsu.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dionp on 19.04.2016.
 */
public interface CommentRepository extends JpaRepository<Comment, Long>{
}
