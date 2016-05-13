package com.grsu.entity;

import org.springframework.data.domain.Persistable;

import javax.persistence.*;
import java.util.List;

/**
 * Created by dionp on 22.04.2016.
 */

@Entity
@Table(name = "groupstudent")
public class GroupStudent implements Persistable<Long>{

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column
    private int course;

    @Column
    private String number;

    public GroupStudent(){
        super();
    }

    public GroupStudent(int course, String number) {
        this.course = course;
        this.number = number;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public Long getId() {
        return null;
    }

    @Override
    public boolean isNew() {
        return false;
    }

    @OneToMany
    private List<User> users;

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
