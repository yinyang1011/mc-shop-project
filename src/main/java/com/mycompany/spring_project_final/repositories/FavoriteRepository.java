/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.FavoriteEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface FavoriteRepository extends CrudRepository<FavoriteEntity, Integer> {

    @Query(value = "SELECT f.id, f.account_id, f.product_id\n"
            + "FROM favorite f\n"
            + "INNER JOIN product p\n"
            + "ON f.product_id = p.id\n"
            + "WHERE p.id = ?1 ",
            nativeQuery = true)
    public FavoriteEntity findFavoriteByProductId(int productId);

    @Query(value = "SELECT id\n"
            + "FROM favorite\n"
            + "WHERE product_id = ?1",
            nativeQuery = true)
    public int findFavoriteIdByProductId(int productId);
}
