/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.FavoriteEntity;
import com.mycompany.spring_project_final.entities.OrdersEntity;
import com.mycompany.spring_project_final.repositories.FavoriteRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
 */
@Service
public class FavoriteService {

    @Autowired
    private FavoriteRepository favoriteRepository;

    public boolean checkExists(FavoriteEntity favoriteEntity) {
        return favoriteRepository.exists(favoriteEntity.getId());
    }
    
    public void deleteId(int productId){
        int favoriteId = favoriteRepository.findFavoriteIdByProductId(productId);
        favoriteRepository.delete(favoriteId);
    }

    public FavoriteEntity findFavoriteByProductId(int productId) {
        return favoriteRepository.findFavoriteByProductId(productId);
    }

    public boolean checkFavoriteId(int productId) {
        FavoriteEntity favoriteEntity = favoriteRepository.findFavoriteByProductId(productId);
        if (favoriteEntity == null) {
            return true;
        }
        return false;
    }
    
    public FavoriteEntity save(FavoriteEntity favoriteEntity) {
        return favoriteRepository.save(favoriteEntity);
    }

}
