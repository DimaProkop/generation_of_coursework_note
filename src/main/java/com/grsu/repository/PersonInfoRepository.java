package com.grsu.repository;

import com.grsu.entity.PersonInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dionp on 09.04.2016.
 */
public interface PersonInfoRepository extends JpaRepository<PersonInfo, Long>{
}
