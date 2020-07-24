/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CUA
 */
@Repository
public interface PromotionDetailRepository extends CrudRepository<PromotionDetailEntity, Integer> {

    @Query(value = "SELECT pd.id, pd.product_id, pd.promotion_id\n"
            + "FROM promotion_detail pd \n"
            + "INNER JOIN promotion p\n"
            + "ON pd.promotion_id = p.id\n"
            + "WHERE pd.product_id = ?1 \n"
            + "AND CURTIME() \n"
            + "BETWEEN p.start_date \n"
            + "AND p.end_date",
            nativeQuery = true)
    public List<PromotionDetailEntity> findByProductId(int productId);

    @Query(value = "SELECT pd.id, pd.product_id, pd.promotion_id\n"
            + "FROM promotion p\n"
            + "INNER JOIN promotion_detail pd\n"
            + "ON p.id = pd.promotion_id\n"
            + "WHERE CURTIME() \n"
            + "BETWEEN p.start_date\n"
            + "AND p.end_date",
            nativeQuery = true)
    public List<PromotionDetailEntity> findProductHavePromotion();

}
