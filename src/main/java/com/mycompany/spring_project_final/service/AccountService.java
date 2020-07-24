/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author CUA
 */
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public AccountEntity findAccountByEmailAndPassword(String email, String password) {
        return accountRepository.findAccountByEmailAndPassword(email, password);
    }
    
    public boolean findAccountByEmail(String email) {
        AccountEntity account = accountRepository.findAccountByEmail(email);
        if (account == null) {
            return false;
        }
        return true;
    }
    
    public AccountEntity save(AccountEntity accountEntity) {
        return accountRepository.save(accountEntity);
    }
    
    public AccountEntity findAccountById(int id) {
        return accountRepository.findOne(id);
    }
}
