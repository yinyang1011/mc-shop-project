/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.AccountEntity;
import java.io.Serializable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CUA
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
