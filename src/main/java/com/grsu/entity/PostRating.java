package com.grsu.entity;

import org.springframework.data.domain.Persistable;

import javax.persistence.*;

/**
 * Created by dionp on 10.04.2016.
 */

@Entity
@Table(name = "postrating")
public class PostRating implements Persistable<Long> {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column
    private int value;


    public PostRating(){
        super();
    }

    public PostRating(int value) {
        this.value = value;
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

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
