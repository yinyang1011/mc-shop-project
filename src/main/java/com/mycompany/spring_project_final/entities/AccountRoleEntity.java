/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.entities;

import com.mycompany.spring_project_final.enums.AccountRole;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "account_role")
public class AccountRoleEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "roles")
    private AccountRole role = AccountRole.ROLE_USER;

    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL)
    private List<AccountRoleDetailEntity> listAccountRoleDetail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public AccountRole getRole() {
        return role;
    }

    public void setRole(AccountRole role) {
        this.role = role;
    }

    public List<AccountRoleDetailEntity> getListAccountRoleDetail() {
        return listAccountRoleDetail;
    }

    public void setListAccountRoleDetail(List<AccountRoleDetailEntity> listAccountRoleDetail) {
        this.listAccountRoleDetail = listAccountRoleDetail;
    }

}
