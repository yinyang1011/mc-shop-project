/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.model;

import com.mycompany.spring_project_final.entities.ProductEntity;

/**
 *
 * @author 54
 *
 */
public class Item {

    private ProductEntity product;
    private int quantity;
    private double discount;

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Item() {
    }

    public Item(ProductEntity product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Item(ProductEntity product, int quantity, double discount) {
        this.product = product;
        this.quantity = quantity;
        this.discount = discount;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
}
