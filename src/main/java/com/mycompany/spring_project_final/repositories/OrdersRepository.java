/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.OrdersEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CUA
 */
@Repository
public interface OrdersRepository extends CrudRepository<OrdersEntity, Integer> {
    @Query(value = "SELECT * \n"
            + "FROM orders\n"
            + "WHERE account_id = ?1",
            nativeQuery = true)
    public List<OrdersEntity> findOrdersByAccountId(int accountId);
}
