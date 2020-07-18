/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "product_image")
public class ProductImageEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "url_image")
    private String urlImage;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotion;

    public ProductImageEntity() {
    }

    public ProductImageEntity(int id, String urlImage, ProductEntity product) {
        this.id = id;
        this.urlImage = urlImage;
        this.product = product;
    }

    public ProductImageEntity(int id, String urlImage, PromotionEntity promotion) {
        this.id = id;
        this.urlImage = urlImage;
        this.promotion = promotion;
    }

    public ProductImageEntity(int id, String urlImage, ProductEntity product, PromotionEntity promotion) {
        this.id = id;
        this.urlImage = urlImage;
        this.product = product;
        this.promotion = promotion;
    }

    public ProductImageEntity(String urlImage) {
        this.urlImage = urlImage;
    }

    public ProductImageEntity(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }

}
