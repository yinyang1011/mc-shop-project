/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.OrdersEntity;
import com.mycompany.spring_project_final.repositories.OrdersRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
 */
@Service
public class OrdersService {

    @Autowired
    private OrdersRepository ordersRepository;

    public OrdersEntity save(OrdersEntity ordersEntity) {
        return ordersRepository.save(ordersEntity);
    }

    public OrdersEntity findOrdersById(int id) {
        return ordersRepository.findOne(id);
    }

    public List<OrdersEntity> findOrdersByAccountId(int accountId) {
        return ordersRepository.findOrdersByAccountId(accountId);
    }

}
