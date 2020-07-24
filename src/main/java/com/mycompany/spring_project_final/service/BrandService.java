/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.BrandEntity;
import com.mycompany.spring_project_final.repositories.BrandRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
 */
@Service
public class BrandService {

    @Autowired
    
    private BrandRepository brandRepository;

    public List<BrandEntity> getBrands() {
        return (List<BrandEntity>) brandRepository.findAll();
    }

    public BrandEntity save(BrandEntity brandEntity) {
        return brandRepository.save(brandEntity);
    }

    public BrandEntity getBrand(int id) {
        return brandRepository.findOne(id);
    }

}
