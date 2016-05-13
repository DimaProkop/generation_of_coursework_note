package com.grsu.service;

import com.grsu.entity.PersonInfo;

import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */
public interface PersonInfoService {

    PersonInfo addPersonInfo(PersonInfo personInfo);
    void delete(Long id);
    PersonInfo editPersonInfo(PersonInfo personInfo);
    List<PersonInfo> getAll();
}
