/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.OrdersDetailEntity;
import com.mycompany.spring_project_final.entities.OrdersEntity;
import com.mycompany.spring_project_final.model.Item;
import com.mycompany.spring_project_final.repositories.OrdersDetailRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author Administrator
 */
@Service
public class OrdersDetailService {

    @Autowired
    private OrdersDetailRepository ordersDetailRepository;

    public void save(OrdersEntity ordersEntity, List<Item> cart) {
        if (ordersEntity != null && ordersEntity.getId() > 0 && !CollectionUtils.isEmpty(cart)) {
            List<OrdersDetailEntity> listOrdersDetail = new ArrayList<>();
            for (Item item : cart) {
                OrdersDetailEntity ordersDetail = new OrdersDetailEntity();
                ordersDetail.setOrders(ordersEntity);
                ordersDetail.setQuantity(item.getQuantity());
                ordersDetail.setPrice(item.getProduct().getProductPrice() * (1 - item.getDiscount()));
                ordersDetail.setProduct(item.getProduct());
                ordersDetail.setDiscount(item.getDiscount());
                listOrdersDetail.add(ordersDetail);
            }
            ordersDetailRepository.save(listOrdersDetail);
        }
    }
}
