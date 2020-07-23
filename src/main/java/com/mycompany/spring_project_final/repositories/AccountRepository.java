/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.AccountEntity;
import java.io.Serializable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface AccountRepository extends CrudRepository<AccountEntity, Integer> {

    @Query(value = "SELECT *\n"
            + "FROM account\n"
            + "WHERE email = ?1 \n"
            + "AND password = ?2\n"
            + ";",
            nativeQuery = true)
    AccountEntity findAccountByEmailAndPassword(
            String email, String password);
    
    @Query(value = "SELECT *\n"
            + "FROM account\n"
            + "WHERE email = ?1 \n"
            + ";",
            nativeQuery = true)
    AccountEntity findAccountByEmail(String email);
}
