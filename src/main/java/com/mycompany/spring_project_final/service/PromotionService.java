/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.PromotionEntity;
import com.mycompany.spring_project_final.repositories.PromotionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
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
