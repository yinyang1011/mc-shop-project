/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.OrdersDetailEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CUA
 */
@Repository
public interface OrdersDetailRepository extends CrudRepository<OrdersDetailEntity, Integer>{
    
}
