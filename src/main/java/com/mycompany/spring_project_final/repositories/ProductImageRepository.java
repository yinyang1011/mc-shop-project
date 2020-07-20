/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.ProductImageEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public interface ProductImageRepository extends CrudRepository<ProductImageEntity, Integer> {

    public List<ProductImageEntity> findByProduct_id(int productId);

    @Query(value = "SELECT *\n"
            + "FROM product_image pi\n"
            + "INNER JOIN promotion p\n"
            + "ON pi.promotion_id = p.id\n"
            + "WHERE CURTIME() \n"
            + "BETWEEN p.start_date\n"
            + "AND p.end_date\n"
            + ";",
            nativeQuery = true)
    public List<ProductImageEntity> findImageCurrentPromotion();

    @Query(value = "SELECT COUNT(*)\n"
            + "FROM product_image pi\n"
            + "INNER JOIN promotion p\n"
            + "ON pi.promotion_id = p.id\n"
            + "WHERE CURTIME() \n"
            + "BETWEEN p.start_date\n"
            + "AND p.end_date\n"
            + ";",
            nativeQuery = true)
    public int countImageOfCurrentPromotion();
}
