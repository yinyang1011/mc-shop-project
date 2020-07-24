/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.BrandEntity;
import com.mycompany.spring_project_final.entities.FavoriteEntity;
import com.mycompany.spring_project_final.entities.OrdersEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import com.mycompany.spring_project_final.service.AccountService;
import com.mycompany.spring_project_final.service.BrandService;
import com.mycompany.spring_project_final.service.FavoriteService;
import com.mycompany.spring_project_final.service.OrdersService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.PromotionDetailService;
import com.mycompany.spring_project_final.service.SendMailSevice;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author My Cua
 */
@Controller
public class AccountController {

    @Autowired
    private BrandService brandService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private SendMailSevice mailSevice;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private ProductService productService;

    @Autowired
    private PromotionDetailService promotionDetailService;

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("account")
    public String ycLogin(Model model, HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("accountSession", account);
        return "signin";
    }

    @RequestMapping("check-login")
    public String checkLogin(Model model,
            @ModelAttribute("email") String email,
            @ModelAttribute("password") String password,
            HttpSession session) {
        AccountEntity account = accountService.findAccountByEmailAndPassword(email, password);
        if (account == null) {
            model.addAttribute("message", "(Email or password does not exist. Please check again!!)");
        } else if (account != null) {
            if (account.getStatus().equalsIgnoreCase("confirmed")) {
                model.addAttribute("message", "(Logged in successfully!!)");
                session.setAttribute("account", account);
            } else if (account.getStatus().equalsIgnoreCase("registered")) {
                model.addAttribute("message", "(Please check your email before login)");
            }
        }
        List<BrandEntity> listBrand = brandService.getBrands();
        model.addAttribute("accountSession", (AccountEntity) session.getAttribute("account"));
        model.addAttribute("listBrand", listBrand);
        return "signin";
    }

    @RequestMapping("register")
    public String register(Model model) {
        List<BrandEntity> listBrand = brandService.getBrands();
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("account", new AccountEntity());
        return "register";
    }

    @RequestMapping(value = "/register-finish", method = RequestMethod.POST)
    public String registerFinish(Model model,
            @ModelAttribute("account") AccountEntity accountEntity,
            HttpSession session) throws MessagingException {
        List<BrandEntity> listBrand = brandService.getBrands();
        boolean exists = accountService.findAccountByEmail(accountEntity.getEmail());
        if (exists) {
            model.addAttribute("message", "(Duplicate Email)");
            model.addAttribute("listBrand", listBrand);
            return "register";
        }
        accountEntity.setStatus("registered");
        accountService.save(accountEntity);

        String link = "http://localhost:8080/Spring_Project_Final/verify-account/" + accountEntity.getId();

        mailSevice.sendEmail(accountEntity.getEmail(), "MCSHOP - VERIFY YOUR ACCOUNT", "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "</head>\n"
                + "<body>\n"
                + "<p id=\"text\" style=\"text-align:center\">Thank you for shopping at MC-Shop !!!</p>\n"
                + "<h4 style=\"text-align:center\"><a href=\"" + link + "\">Please click on this link to confirm your Account</a></h4>"
                + "</body>\n"
                + "</html>");
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("message", "(Please check your email before login)");
        return "signin";
    }

    @RequestMapping(value = "/verify-account/{accountId}")
    public String verifyEmail(Model model,
            @PathVariable("accountId") int accountId) {
        AccountEntity accountEntity = accountService.findAccountById(accountId);
        accountEntity.setStatus("confirmed");
        accountService.save(accountEntity);
        model.addAttribute("message", "(Your email has been confirmed. Please login)");
        return "signin";
    }

    @RequestMapping(value = "logout")
    public String logout(Model model, HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        session.removeAttribute("account");
        model.addAttribute("listBrand", listBrand);
        return "signin";
    }

    @RequestMapping("information")
    public String showFormInformation(Model model, HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("accountSession", account);
        model.addAttribute("account", new AccountEntity());
        return "register";
    }

    @RequestMapping(value = "/edit-infor", method = RequestMethod.POST)
    public String editInformation(Model model,
            @ModelAttribute("account") AccountEntity accountEntity,
            HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");

        account.setFirstName(accountEntity.getFirstName());
        account.setLastName(accountEntity.getLastName());
        account.setPassword(accountEntity.getPassword());
        account.setAddress(accountEntity.getAddress());
        account.setPhone(accountEntity.getPhone());
        account.setIdCard(accountEntity.getIdCard());
        account.setBirthDate(accountEntity.getBirthDate());
        account.setGender(accountEntity.getGender());

        accountService.save(account);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("accountSession", account);
        return "signin";
    }

    @RequestMapping("owner-orders")
    public String showOwnerOrders(Model model, HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("accountSession", account);
        List<OrdersEntity> listOrders = ordersService.findOrdersByAccountId(account.getId());
        model.addAttribute("listOrders", listOrders);
        return "owner-orders";
    }

    @RequestMapping("favorite")
    public String showFavoriteProducts(Model model, HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if (account == null) {
            model.addAttribute("message", "(Log in before adding/view favorite products!)");
            return "signin";
        }
        List<ProductEntity> listProducts = productService.findFavoriteProducts(account.getId());
        List<PromotionDetailEntity> listPromotion = (List<PromotionDetailEntity>) promotionDetailService.getProductHavePromotion();
        model.addAttribute("listPromotion", listPromotion);

        List<ProductEntity> productListNPM = (List<ProductEntity>) productService.getProductNoPromotion();
        model.addAttribute("productListNPM", productListNPM);
        model.addAttribute("listProducts", listProducts);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("accountSession", account);
        return "favorite";
    }

    @RequestMapping(value = "remove-favorite-product/{productId}", method = RequestMethod.GET)
    public String removeFavoriteProducts(Model model,
            @PathVariable("productId") int productId,
            HttpSession session) {
        FavoriteEntity favoriteEntity = favoriteService.findFavoriteByProductId(productId);
        favoriteEntity.setAccount(null);
        favoriteEntity.setProduct(null);
        favoriteService.deleteId(productId);

        if (!favoriteService.checkExists(favoriteEntity)) {
            model.addAttribute("message", "(Delete Success!)");
        }
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "redirect:/favorite";
    }

    @RequestMapping("/favorite/{productId}")
    public String addFavorite(Model model,
            @PathVariable("productId") int productId,
            HttpSession session) {
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if (account == null) {
            model.addAttribute("message", "(Log in before adding/view favorite products!)");
            return "signin";
        }
        ProductEntity productEntity = productService.findProductById(productId);
        if (favoriteService.checkFavoriteId(productId)) {
            FavoriteEntity favoriteEntity = new FavoriteEntity();
            favoriteEntity.setAccount(account);
            favoriteEntity.setProduct(productEntity);
            favoriteService.save(favoriteEntity);
        } else {
            model.addAttribute("message", "(Products already in the wishlist!)");
            List<ProductEntity> listProducts = productService.findFavoriteProducts(account.getId());
            List<PromotionDetailEntity> listPromotion = (List<PromotionDetailEntity>) promotionDetailService.getProductHavePromotion();
            model.addAttribute("listPromotion", listPromotion);
            List<ProductEntity> productListNPM = (List<ProductEntity>) productService.getProductNoPromotion();
            model.addAttribute("productListNPM", productListNPM);
            model.addAttribute("listProducts", listProducts);
            model.addAttribute("listBrand", listBrand);
            model.addAttribute("accountSession", account);
            return "favorite";
        }

        List<ProductEntity> listProducts = productService.findFavoriteProducts(account.getId());
        List<PromotionDetailEntity> listPromotion = (List<PromotionDetailEntity>) promotionDetailService.getProductHavePromotion();
        model.addAttribute("listPromotion", listPromotion);
        List<ProductEntity> productListNPM = (List<ProductEntity>) productService.getProductNoPromotion();
        model.addAttribute("productListNPM", productListNPM);
        model.addAttribute("listProducts", listProducts);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("accountSession", account);
        return "favorite";
    }
}
