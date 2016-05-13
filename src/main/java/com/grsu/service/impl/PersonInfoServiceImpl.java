package com.grsu.service.impl;

import com.grsu.entity.PersonInfo;
import com.grsu.repository.PersonInfoRepository;
import com.grsu.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dionp on 10.04.2016.
 */
@Service
public class PersonInfoServiceImpl implements PersonInfoService{

    @Autowired
    private PersonInfoRepository personInfoRepository;

    @Override
    public PersonInfo addPersonInfo(PersonInfo personInfo) {
        return personInfoRepository.saveAndFlush(personInfo);
    }

    @Override
    public void delete(Long id) {
        personInfoRepository.delete(id);
    }

    @Override
    public PersonInfo editPersonInfo(PersonInfo personInfo) {
        return personInfoRepository.saveAndFlush(personInfo);
    }

    @Override
    public List<PersonInfo> getAll() {
        return personInfoRepository.findAll();
    }
}
