package com.grsu.entity;

import org.springframework.data.domain.Persistable;

import javax.persistence.*;

/**
 * Created by dionp on 22.04.2016.
 */
@Entity
@Table(name = "nationality")
public class Nationality implements Persistable<Long>{

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column
    private String name;

    public Nationality(String name) {
        this.name = name;
    }

    public Nationality() {
        super();
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
