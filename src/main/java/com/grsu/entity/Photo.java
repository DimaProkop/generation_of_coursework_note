package com.grsu.entity;

import org.springframework.data.domain.Persistable;

import javax.persistence.*;

/**
 * Created by dionp on 22.04.2016.
 */

@Entity
@Table(name = "photo")
public class Photo implements Persistable<Long>{

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column
    private String path;

    public Photo(){
        super();
    }

    public Photo(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setId(Long id) {
        this.id = id;
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
