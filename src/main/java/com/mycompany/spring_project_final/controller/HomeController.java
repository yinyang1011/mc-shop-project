/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.BrandEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import com.mycompany.spring_project_final.service.BrandService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.PromotionDetailService;
import com.mycompany.spring_project_final.service.SendMailSevice;
import java.util.List;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Man
 */
@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private SendMailSevice mailSevice;
    @Autowired
    private PromotionDetailService promotionDetailService;

    private void init(Model model) {
        List<ProductEntity> productlist = (List<ProductEntity>) productService.getProducts();
        model.addAttribute("products", productlist);

        List<BrandEntity> listBrand = brandService.getBrands();
        model.addAttribute("listBrand", listBrand);
        
        List<PromotionDetailEntity> listPromotion = (List<PromotionDetailEntity>) promotionDetailService.getProductHavePromotion();
        model.addAttribute("listPromotion", listPromotion);
        
        List<ProductEntity> productListNPM = (List<ProductEntity>) productService.getProductNoPromotion();
        model.addAttribute("productListNPM", productListNPM);
    }  

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String viewHome(Model model) {
        init(model);
        return "home";
    }

    @RequestMapping("/login")
    public String viewLogin(Model model,
            @RequestParam(value = "error", required = false) boolean isError) {
        if (isError) {
            model.addAttribute("message", "login fail.");
        }
        return "login";
    }

    @RequestMapping("/detail-product/{productId}")
    public String viewProduct(Model model,
            @PathVariable("productId") int productId
    ) {
        init(model);
        ProductEntity product = productService.findProductById(productId);
        model.addAttribute("product", product);
        return "detail";
    }

    @RequestMapping("/store")
    public String store(Model model
    ) {
        init(model);
        return "store";
    }

    @RequestMapping("/about-us")
    public String aboutUs(Model model
    ) {
        init(model);
        return "aboutus";
    }

    @RequestMapping("/store-detail/{brandId}")
    public String viewProductWithBrand(Model model,
            @PathVariable("brandId") int brandId
    ) {
        init(model);
        List<ProductEntity> products = productService.getProductsByBrandId(brandId);
        model.addAttribute("products", products);
        return "storedetail";
    }

    @RequestMapping(value = "/sendemail", method = RequestMethod.POST)
    public String sendEmail(Model model,
            @ModelAttribute("email") String email
    ) throws MessagingException {
        mailSevice.sendEmail(email, "MCSHOP", "Thank you for your interest in MC-Shop products.");
        return "redirect:/home";
    }
}
