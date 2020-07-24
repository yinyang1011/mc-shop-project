/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import com.mycompany.spring_project_final.entities.PromotionEntity;
import com.mycompany.spring_project_final.repositories.PromotionDetailRepository;
import com.mycompany.spring_project_final.repositories.PromotionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
 */
@Service
public class PromotionDetailService {

    @Autowired
    
    private PromotionDetailRepository promotionDetailRepository;

    public List<PromotionDetailEntity> getDetailPromotions() {
        return (List<PromotionDetailEntity>) promotionDetailRepository.findAll();
    }

    public PromotionDetailEntity save(PromotionDetailEntity promotionDetailEntity) {
        return promotionDetailRepository.save(promotionDetailEntity);
    }

    public PromotionDetailEntity getDetailPromotion(int id) {
        return promotionDetailRepository.findOne(id);
    }
    
    public List<PromotionDetailEntity> getDetailPromotionByProductId(int productId){
        return promotionDetailRepository.findByProductId(productId);
    }
    
    public List<PromotionDetailEntity> getProductHavePromotion(){
        return promotionDetailRepository.findProductHavePromotion();
    }
}
