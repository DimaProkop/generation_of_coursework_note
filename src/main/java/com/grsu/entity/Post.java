package com.grsu.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.domain.Persistable;

import javax.persistence.*;
import java.util.List;


/**
 * Created by dionp on 09.04.2016.
 */

@Entity
@Table(name = "post")
public class Post implements Persistable<Long> {

    @Id
    @SequenceGenerator(name = "post_seq", sequenceName = "post_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "post_seq")
    @Column(name = "id")
    private Long id;

    @Column
    private String title;

    @Column
    private String text;

    public Post(){
        super();
    }

    public Post(String title, String text) {
        this.title = title;
        this.text = text;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public boolean isNew() {
        return false;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


    @OneToOne(cascade = CascadeType.ALL)
    private PostRating postRating;

    public PostRating getPostRating() {
        return postRating;
    }

    public void setPostRating(PostRating postRating) {
        this.postRating = postRating;
    }

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post", fetch = FetchType.EAGER)
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
