package com.grsu.entity;

import org.springframework.data.domain.Persistable;

import javax.persistence.*;

/**
 * Created by dionp on 22.04.2016.
 */
@Entity
@Table(name = "userrating")
public class UserRating implements Persistable<Long>{

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column
    private int value;

    public UserRating(){
        super();
    }

    public UserRating(int value) {
        this.value = value;
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

    @Override
    public Long getId() {
        return null;
    }

    @Override
    public boolean isNew() {
        return false;
    }
}
