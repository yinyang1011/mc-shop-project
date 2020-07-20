/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ProductImageEntity;
import com.mycompany.spring_project_final.entities.PromotionEntity;
import com.mycompany.spring_project_final.repositories.ProductImageRepository;
import com.mycompany.spring_project_final.repositories.PromotionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class ProductImageService {

    @Autowired
    
    private ProductImageRepository productImageRepository;

    public List<ProductImageEntity> getImageById(int productId) {
        return (List<ProductImageEntity>) productImageRepository.findByProduct_id(productId);
    }
    
    public List<ProductImageEntity> getImageInCurrentPromotion() {
        return (List<ProductImageEntity>) productImageRepository.findImageCurrentPromotion();
    }
    
    public int countImage(){
        return productImageRepository.countImageOfCurrentPromotion();
    }

}
