/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.OrdersEntity;
import com.mycompany.spring_project_final.repositories.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
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
    
}
