package com.grsu.entity;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.domain.Persistable;

import javax.persistence.*;

/**
 * Created by dionp on 09.04.2016.
 */
@Entity
@Table(name = "personinfo")
public class PersonInfo implements Persistable<Long>{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "person_info_seq")
    @SequenceGenerator(name = "person_info_seq", sequenceName = "person_info_id_seq", allocationSize = 1)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String surname;

    @Column(nullable = false)
    private String birthday;

    @Column(nullable = false)
    private String email;

    public PersonInfo(){
        super();
    }

    public PersonInfo(String name, String surname, String birthday, String email) {
        this.name = name;
        this.surname = surname;
        this.birthday = birthday;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    @OneToOne(cascade = CascadeType.ALL)
    private Nationality nationality;

    public Nationality getNationality() {
        return nationality;
    }

    public void setNationality(Nationality nationality) {
        this.nationality = nationality;
    }

    @OneToOne(cascade = CascadeType.ALL)
    private Photo photo;

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }
}
