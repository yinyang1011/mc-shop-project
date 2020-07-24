/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.Hibernate;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "product")
public class ProductEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "product_price")
    private double productPrice;

    @Column(name = "product_url_image")
    private String productUrlImage;

    @Column(name = "product_description")
    private String productDescription;

    @Column(name = "processor_type")
    private String processorType;

    @Column(name = "hard_drive_capacity")
    private String hardDriveCapacity;

    @Column(name = "processor_speed")
    private String processorSpeed;

    @Column(name = "wireless_technology")
    private String wirelessTechnology;

    @Column(name = "ram_memory")
    private String ramMemory;

    @Column(name = "operating_system")
    private String operatingSystem;

    private String battery;

    @Column(name = "screen_size")
    private String screenSize;

    @Column(name = "video_graphics_adaptor")
    private String videoGraphicsAdaptor;

    private String weight;

    @ManyToOne
    @JoinColumn(name = "brandId")
    private BrandEntity brand;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<PromotionDetailEntity> listPromotionDetail;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<ProductImageEntity> listProductImage;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<OrdersDetailEntity> listOrderDetail;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<FavoriteEntity> listFavorite;

    public ProductEntity() {
    }

    public ProductEntity(int id, String productName, double productPrice, String productUrlImage, String productDescription) {
        this.id = id;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productUrlImage = productUrlImage;
        this.productDescription = productDescription;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductUrlImage() {
        return productUrlImage;
    }

    public void setProductUrlImage(String productUrlImage) {
        this.productUrlImage = productUrlImage;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public BrandEntity getBrand() {
        return brand;
    }

    public void setBrand(BrandEntity brand) {
        this.brand = brand;
    }

    public List<PromotionDetailEntity> getListPromotionDetail() {
        if (Hibernate.isInitialized(listPromotionDetail)) {
            return listPromotionDetail;
        }
        return new ArrayList<>();
    }

    public void setListPromotionDetail(List<PromotionDetailEntity> listPromotionDetail) {
        this.listPromotionDetail = listPromotionDetail;
    }

    public List<ProductImageEntity> getListProductImage() {
        if (Hibernate.isInitialized(listProductImage)) {
            return listProductImage;
        }
        return new ArrayList<>();
    }

    public void setListProductImage(List<ProductImageEntity> listProductImage) {
        this.listProductImage = listProductImage;
    }

    public List<OrdersDetailEntity> getListOrderDetail() {
        if (Hibernate.isInitialized(listOrderDetail)) {
            return listOrderDetail;
        }
        return new ArrayList<>();
    }

    public void setListOrderDetail(List<OrdersDetailEntity> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }

    public String getProcessorType() {
        return processorType;
    }

    public void setProcessorType(String processorType) {
        this.processorType = processorType;
    }

    public String getHardDriveCapacity() {
        return hardDriveCapacity;
    }

    public void setHardDriveCapacity(String hardDriveCapacity) {
        this.hardDriveCapacity = hardDriveCapacity;
    }

    public String getProcessorSpeed() {
        return processorSpeed;
    }

    public void setProcessorSpeed(String processorSpeed) {
        this.processorSpeed = processorSpeed;
    }

    public String getWirelessTechnology() {
        return wirelessTechnology;
    }

    public void setWirelessTechnology(String wirelessTechnology) {
        this.wirelessTechnology = wirelessTechnology;
    }

    public String getRamMemory() {
        return ramMemory;
    }

    public void setRamMemory(String ramMemory) {
        this.ramMemory = ramMemory;
    }

    public String getOperatingSystem() {
        return operatingSystem;
    }

    public void setOperatingSystem(String operatingSystem) {
        this.operatingSystem = operatingSystem;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public String getScreenSize() {
        return screenSize;
    }

    public void setScreenSize(String screenSize) {
        this.screenSize = screenSize;
    }

    public String getVideoGraphicsAdaptor() {
        return videoGraphicsAdaptor;
    }

    public void setVideoGraphicsAdaptor(String videoGraphicsAdaptor) {
        this.videoGraphicsAdaptor = videoGraphicsAdaptor;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public List<FavoriteEntity> getListFavorite() {
        if (Hibernate.isInitialized(listFavorite)) {
            return listFavorite;
        }
        return new ArrayList<>();
    }

    public void setListFavorite(List<FavoriteEntity> listFavorite) {
        this.listFavorite = listFavorite;
    }

}
