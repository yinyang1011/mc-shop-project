/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.repositories.ProductRepository;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
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
    
    public List<ProductEntity> searchProductByName(String searchStr) {
        return productRepository.findByProduct_name(searchStr);
    }
    
    public List<ProductEntity> searchProductByRam(String searchStr) {
        return productRepository.findByRam_memory(searchStr);
    }
    
    public List<ProductEntity> searchProductByChip(String searchStr) {
        return productRepository.findByProcessor_type(searchStr);
    }
    
    public List<ProductEntity> findProductHot() {
        return productRepository.findProductHot();
    }
    
    public List<ProductEntity> findFavoriteProducts(int accountId) {
        return productRepository.findFavoriteProducts(accountId);
    }
    
    public List<ProductEntity> sortProductsAsc(List<ProductEntity> products) {   
        List<ProductEntity> productsAsc = products.stream() 
                .sorted(Comparator.comparingDouble(ProductEntity::getProductPrice)) 
                .collect(Collectors.toList());
        return productsAsc;
    }
    public List<ProductEntity> sortProductsDesc(List<ProductEntity> products) {   
        List<ProductEntity> productsDesc = products.stream() 
                .sorted(Comparator.comparingDouble(ProductEntity::getProductPrice).reversed()) 
                .collect(Collectors.toList());
        return productsDesc;
    }
}
