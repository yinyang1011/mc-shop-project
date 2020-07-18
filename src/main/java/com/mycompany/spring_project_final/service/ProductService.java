/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.repositories.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    BrandService brandService;

    public List<ProductEntity> getProducts() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public ProductEntity findProductById(int id) {
        return productRepository.findOne(id);
    }

    public boolean delete(int id) {
        productRepository.delete(id);
        return productRepository.exists(id);
    }

    public List<ProductEntity> getProductsByBrandId(int brandId) {
        return (List<ProductEntity>) productRepository.findByBrandId(brandId);
    }

    public List<ProductEntity> getProductNoPromotion() {
        return productRepository.findProductNoPromotion();
    }
}
