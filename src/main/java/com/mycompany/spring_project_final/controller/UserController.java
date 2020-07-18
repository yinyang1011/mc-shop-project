/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author AnhLe
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/home")
    public String viewHome(Model model) {
        model.addAttribute("message", "User Home Page");
        return "user/home";
    }
}
