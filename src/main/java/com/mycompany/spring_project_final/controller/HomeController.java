/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.BrandEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.ProductImageEntity;
import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import com.mycompany.spring_project_final.model.Item;
import com.mycompany.spring_project_final.service.BrandService;
import com.mycompany.spring_project_final.service.ProductImageService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.PromotionDetailService;
import com.mycompany.spring_project_final.service.SendMailSevice;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
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

        List<ProductEntity> productListHot = (List<ProductEntity>) productService.findProductHot();
        model.addAttribute("productListHot", productListHot);

    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String viewHome(Model model, HttpSession session) {
        init(model);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
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
    public String viewProductPromotion(Model model, HttpSession session) {
        init(model);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "promotion";
    }


    @RequestMapping("/detail-product/{productId}")
    public String viewProduct(Model model,
            @PathVariable("productId") int productId,
            HttpSession session
    ) {
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        init(model);
        ProductEntity product = productService.findProductById(productId);
        List<ProductImageEntity> listImages = productImageService.getImageById(productId);
        model.addAttribute("listImages", listImages);
        model.addAttribute("product", product);
        return "detail";
    }

    @RequestMapping("/store")
    public String store(Model model, HttpSession session
    ) {
        init(model);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "store";
    }

    @RequestMapping("/about-us")
    public String aboutUs(Model model, HttpSession session
    ) {
        init(model);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "aboutus";
    }

    @RequestMapping("/store-detail/{brandId}")
    public String viewProductWithBrand(Model model,
            @PathVariable("brandId") int brandId,
            HttpSession session
    ) {
        init(model);
        List<ProductEntity> products = productService.getProductsByBrandId(brandId);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        model.addAttribute("products", products);
        model.addAttribute("brandId", brandId);
        return "storedetail";
    }

    @RequestMapping(value = "/sendemail", method = RequestMethod.POST)
    public String sendEmail(Model model,
            @ModelAttribute("email") String email,
            HttpSession session
    ) throws MessagingException {
        mailSevice.sendEmail(email, "MCSHOP", "Thank you for your interest in MC-Shop products.");
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "aboutus";
    }

    @RequestMapping("/search")
    public String search(Model model,
            @ModelAttribute("searchId") int searchId,
            @ModelAttribute("searchStr") String searchStr,
            HttpSession session
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
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "result";
    }

    @RequestMapping(value = "compare", method = RequestMethod.GET)
    public String indexCompare(Model model, HttpSession session) {
        init(model);
        List<BrandEntity> listBrand = brandService.getBrands();
        ProductEntity p1 = (ProductEntity) session.getAttribute("p1");
        ProductEntity p2 = (ProductEntity) session.getAttribute("p2");
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("p1", p1);
        model.addAttribute("p2", p2);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "compare";
    }

    @RequestMapping("/compare/{productId}")
    public String compareProduct(Model model,
            HttpSession session,
            @PathVariable("productId") int productId
    ) {
        init(model);
        ProductEntity product = productService.findProductById(productId);
        if (session.getAttribute("p1") == null) {
            session.setAttribute("p1", product);
        } else if (session.getAttribute("p2") == null) {
            session.setAttribute("p2", product);
        } else if (session.getAttribute("p2") != null && session.getAttribute("p2") != null) {
            model.addAttribute("messageError", "Please delete the product you are comparing before adding a new one.");
        }
        model.addAttribute("p1", session.getAttribute("p1"));
        model.addAttribute("p2", session.getAttribute("p2"));
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "compare";
    }

    @RequestMapping(value = "remove-compare/{productId}", method = RequestMethod.GET)
    public String removeCompare(Model model,
            @PathVariable("productId") int productId,
            HttpSession session) {
        init(model);
        List<BrandEntity> listBrand = brandService.getBrands();
        ProductEntity product = productService.findProductById(productId);
        ProductEntity p1 = (ProductEntity) session.getAttribute("p1");
        ProductEntity p2 = (ProductEntity) session.getAttribute("p2");
        if (p1 == null) {
            if (p2.getId() == product.getId()) {
                session.removeAttribute("p2");
            }
        } else if (p1 != null) {
            if (p1.getId() == product.getId()) {
                session.removeAttribute("p1");
            } else if (p2.getId() == product.getId()) {
                session.removeAttribute("p2");
            }
        }
        model.addAttribute("listBrand", listBrand);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "compare";
    }

    @RequestMapping("sortasc")
    public String sortAsc(Model model, HttpSession session
    ) {
        init(model);
        List<ProductEntity> products = (List<ProductEntity>) productService.getProducts();
        model.addAttribute("products", products);
        List<ProductEntity> productsAsc = productService.sortProductsAsc(products);
        model.addAttribute("productsPrice", productsAsc);
        model.addAttribute("x", 1);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "sort";
    }

    @RequestMapping("sortdesc")
    public String sortDesc(Model model, HttpSession session
    ) {
        init(model);
        List<ProductEntity> products = (List<ProductEntity>) productService.getProducts();
        model.addAttribute("products", products);
        List<ProductEntity> productsDesc = productService.sortProductsDesc(products);
        model.addAttribute("productsPrice", productsDesc);
        model.addAttribute("x", 0);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "sort";
    }
}
