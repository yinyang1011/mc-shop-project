/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.BrandEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.ProductImageEntity;
import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import com.mycompany.spring_project_final.service.BrandService;
import com.mycompany.spring_project_final.service.ProductImageService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.PromotionDetailService;
import com.mycompany.spring_project_final.service.SendMailSevice;
import java.util.ArrayList;
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

    @Autowired
    private ProductImageService productImageService;

    private void init(Model model) {
        List<ProductEntity> productlist = (List<ProductEntity>) productService.getProducts();
        model.addAttribute("products", productlist);

        List<BrandEntity> listBrand = brandService.getBrands();
        model.addAttribute("listBrand", listBrand);

        List<PromotionDetailEntity> listPromotion = (List<PromotionDetailEntity>) promotionDetailService.getProductHavePromotion();
        model.addAttribute("listPromotion", listPromotion);

        List<ProductEntity> productListNPM = (List<ProductEntity>) productService.getProductNoPromotion();
        model.addAttribute("productListNPM", productListNPM);

//        List<ProductEntity> productListHot = (List<ProductEntity>) productService.findProductHot();
//        model.addAttribute("productListHot", productListHot);
    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String viewHome(Model model) {
        init(model);
        List<ProductImageEntity> listImagePromotion = productImageService.getImageInCurrentPromotion();

        ProductImageEntity imageIndex = listImagePromotion.get(0);

        List<ProductImageEntity> images = new ArrayList<>();

        for (int i = 1; i < listImagePromotion.size(); i++) {
            images.add(listImagePromotion.get(i));
        }

        model.addAttribute("imageIndex", imageIndex);
        model.addAttribute("images", images);
        model.addAttribute("countImage", productImageService.countImage());
        return "home";
    }

    @RequestMapping(value = "/promotion", method = RequestMethod.GET)
    public String viewProductPromotion(Model model) {
        init(model);
        return "promotion";
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
        List<ProductImageEntity> listImages = productImageService.getImageById(productId);
        model.addAttribute("listImages", listImages);
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
        model.addAttribute("brandId", brandId);
        return "store";
    }

    @RequestMapping(value = "/sendemail", method = RequestMethod.POST)
    public String sendEmail(Model model,
            @ModelAttribute("email") String email
    ) throws MessagingException {
        mailSevice.sendEmail(email, "MCSHOP", "Thank you for your interest in MC-Shop products.");
        return "aboutus";
    }

    @RequestMapping("/search")
    public String search(Model model,
            @ModelAttribute("searchId") int searchId,
            @ModelAttribute("searchStr") String searchStr
    ) {
        String x = "%" + searchStr + "%";
        init(model);
        if (searchId == 0) {
            List<ProductEntity> products = productService.searchProductByName(x);
            model.addAttribute("listProducts", products);
        } else if (searchId == 1) {
            List<ProductEntity> products = productService.searchProductByRam(x);
            model.addAttribute("listProducts", products);
        } else if (searchId == 2) {
            List<ProductEntity> products = productService.searchProductByChip(x);
            model.addAttribute("listProducts", products);
        }
        model.addAttribute("errorMessage", "Not Found: \"" + searchStr + "\" in any documents.");
        return "result";
    }
}
