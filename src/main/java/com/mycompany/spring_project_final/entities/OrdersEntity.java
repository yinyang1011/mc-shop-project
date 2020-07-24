/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "orders")
public class OrdersEntity extends Profile implements Serializable  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String status; 
    
    @Temporal(TemporalType.DATE)
    @Column(name = "order_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "ship_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date shipDate;

    @Column(name = "total_price")
    private double totalPrice;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "account_id")
    private AccountEntity account;
    
    @OneToMany(mappedBy = "orders",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<OrdersDetailEntity> listOrdersDetail;
    
    public OrdersEntity(){}

    public OrdersEntity(double totalPrice, List<OrdersDetailEntity> listOrdersDetail, String firstName, String lastName, String email, String phone, String address, String idCard, String gender, Date birthDate) {
        super(firstName, lastName, email, phone, address, idCard, gender, birthDate);
        this.totalPrice = totalPrice;
        this.listOrdersDetail = listOrdersDetail;
    }

    public OrdersEntity(String firstName, String lastName, String email, String phone, String address, String idCard, String gender, Date birthDate) {
        super(firstName, lastName, email, phone, address, idCard, gender, birthDate);
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }

    public List<OrdersDetailEntity> getListOrdersDetail() {
        return listOrdersDetail;
    }

    public void setListOrdersDetail(List<OrdersDetailEntity> listOrdersDetail) {
        this.listOrdersDetail = listOrdersDetail;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
