/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.PromotionEntity;
import com.mycompany.spring_project_final.repositories.PromotionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
 */
@Service
public class PromotionService {

    @Autowired
    
    private PromotionRepository promotionRepository;

    public List<PromotionEntity> getPromotions() {
        return (List<PromotionEntity>) promotionRepository.findAll();
    }

    public PromotionEntity save(PromotionEntity promotionEntity) {
        return promotionRepository.save(promotionEntity);
    }

    public PromotionEntity getPromotion(int id) {
        return promotionRepository.findOne(id);
    }

}
