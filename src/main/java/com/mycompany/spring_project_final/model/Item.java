/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.model;

import com.mycompany.spring_project_final.entities.ProductEntity;

/**
 *
 * @author CUA
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
