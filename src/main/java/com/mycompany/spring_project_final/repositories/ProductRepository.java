/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer>{
    public List<ProductEntity> findByBrandId(int brandId);
    @Query(value = "SELECT *\n"
            + "FROM product\n"
            + "WHERE id NOT IN (\n"
            + "SELECT pd.product_id\n"
            + "FROM promotion p\n"
            + "INNER JOIN promotion_detail pd\n"
            + "ON p.id = pd.promotion_id\n"
            + "WHERE CURTIME() \n"
            + "BETWEEN p.start_date\n"
            + "AND p.end_date\n"
            + ")",
            nativeQuery = true)
    public List<ProductEntity> findProductNoPromotion();
}
