/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CUA
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {

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

    @Query(value = "SELECT *\n"
            + "FROM product\n"
            + "WHERE product_name LIKE ?1",
            nativeQuery = true)
    public List<ProductEntity> findByProduct_name(String searchStr);

    @Query(value = "SELECT *\n"
            + "FROM product\n"
            + "WHERE ram_memory LIKE ?1",
            nativeQuery = true)
    public List<ProductEntity> findByRam_memory(String searchStr);

    @Query(value = "SELECT *\n"
            + "FROM product\n"
            + "WHERE processor_type LIKE ?1",
            nativeQuery = true)
    public List<ProductEntity> findByProcessor_type(String searchStr);

    @Query(value = "SELECT p.battery, p.brandId, p.hard_drive_capacity, p.operating_system, p.id, p.processor_speed, p.processor_type, p.product_description,\n"
            + "p.product_name, p.product_price, p.product_url_image, p.ram_memory, p.screen_size, p.video_graphics_adaptor, p.weight, p.wireless_technology\n"
            + "FROM orders_detail o\n"
            + "INNER JOIN product p\n"
            + "ON o.product_id = p.id\n"
            + "GROUP BY o.product_id \n"
            + "ORDER BY o.quantity+(count(*)-1)\n"
            + "DESC\n"
            + "LIMIT 5",
            nativeQuery = true)
    public List<ProductEntity> findProductHot();

    @Query(value = "SELECT p.battery, p.brandId, p.hard_drive_capacity, p.operating_system, p.id, p.processor_speed, p.processor_type, p.product_description,\n"
            + "p.product_name, p.product_price, p.product_url_image, p.ram_memory, p.screen_size, p.video_graphics_adaptor, p.weight, p.wireless_technology\n"
            + "FROM product p\n"
            + "INNER JOIN favorite f\n"
            + "ON p.id = f.product_id\n"
            + "WHERE f.account_id = ?1",
            nativeQuery = true)
    public List<ProductEntity> findFavoriteProducts(int accountId);
}
