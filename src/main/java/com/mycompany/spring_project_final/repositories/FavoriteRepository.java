/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.FavoriteEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CUA
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
