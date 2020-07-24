/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "account")
public class AccountEntity extends Profile implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String email;
    private String password;
    private String status;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<OrdersEntity> listOrders;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<FavoriteEntity> listFavorite;
    
    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<AccountRoleDetailEntity> listAccountRoleDetail;
    
    public AccountEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrdersEntity> getListOrders() {
        return listOrders;
    }

    public void setListOrders(List<OrdersEntity> listOrders) {
        this.listOrders = listOrders;
    }

    public List<FavoriteEntity> getListFavorite() {
        return listFavorite;
    }

    public void setListFavorite(List<FavoriteEntity> listFavorite) {
        this.listFavorite = listFavorite;
    }

    public List<AccountRoleDetailEntity> getListAccountRoleDetail() {
        return listAccountRoleDetail;
    }

    public void setListAccountRoleDetail(List<AccountRoleDetailEntity> listAccountRoleDetail) {
        this.listAccountRoleDetail = listAccountRoleDetail;
    }
    
}
