/*
 * Document   : MC-Project
 * Finished   : 25/07/2020
 * Author     : Nguyen Ngoc Man
 */
package com.mycompany.spring_project_final.controller;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.BrandEntity;
import com.mycompany.spring_project_final.entities.OrdersDetailEntity;
import com.mycompany.spring_project_final.entities.OrdersEntity;
import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.entities.PromotionDetailEntity;
import com.mycompany.spring_project_final.model.Item;
import com.mycompany.spring_project_final.service.BrandService;
import com.mycompany.spring_project_final.service.OrdersDetailService;
import com.mycompany.spring_project_final.service.OrdersService;
import com.mycompany.spring_project_final.service.ProductService;
import com.mycompany.spring_project_final.service.PromotionDetailService;
import com.mycompany.spring_project_final.service.PromotionService;
import com.mycompany.spring_project_final.service.SendMailSevice;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author CUA
 */
@Controller
public class CartController {

    @Autowired
    private ProductService productService;
    @Autowired
    private SendMailSevice mailSevice;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private OrdersDetailService ordersDetailService;
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private PromotionDetailService promotionDetailService;
    @Autowired
    private BrandService brandService;

    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        double totalPrice = 0;
        if (!CollectionUtils.isEmpty(cart)) {
            for (Item item : cart) {
                totalPrice = totalPrice + (1 - item.getDiscount()) * (item.getProduct().getProductPrice() * item.getQuantity());
            }
        }
        List<BrandEntity> listBrand = brandService.getBrands();
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("sessionCart", cart);
        return "cart";
    }

    private int exists(int id, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getId() == id) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping("/order-product/{productId}")
    public String orderProduct(Model model,
            @PathVariable("productId") int productId, HttpSession session) {
        ProductEntity product = productService.findProductById(productId);
        List<PromotionDetailEntity> promotionDetails
                = promotionDetailService.getDetailPromotionByProductId(productId);
        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            if (!CollectionUtils.isEmpty(promotionDetails)) {
                for (PromotionDetailEntity promotionDetail : promotionDetails) {
                    cart.add(new Item(product, 1, promotionDetail.getPromotion().getDiscountValue()));
                }
            } else {
                cart.add(new Item(product, 1, 0));
            }
            session.setAttribute("cart", cart);
        } else {
            List<Item> cart = (List<Item>) session.getAttribute("cart");

            int index = this.exists(productId, cart);

            if (index == -1) {
                if (!CollectionUtils.isEmpty(promotionDetails)) {
                    for (PromotionDetailEntity promotionDetail : promotionDetails) {
                        cart.add(new Item(product, 1, promotionDetail.getPromotion().getDiscountValue()));
                    }
                } else {
                    cart.add(new Item(product, 1, 0));
                }
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        if (product != null && product.getId() > 0) {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            double totalPrice = 0;
            if (!CollectionUtils.isEmpty(cart)) {
                for (Item item : cart) {
                    totalPrice = totalPrice + (1 - item.getDiscount()) * (item.getProduct().getProductPrice() * item.getQuantity());
                }
            }
            List<BrandEntity> listBrand = brandService.getBrands();
            model.addAttribute("listBrand", listBrand);
            model.addAttribute("sessionCart", session.getAttribute("cart"));
            model.addAttribute("totalPrice", totalPrice);
            AccountEntity account = (AccountEntity) session.getAttribute("account");
            model.addAttribute("accountSession", account);
            return "cart";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "remove-product/{productId}", method = RequestMethod.GET)
    public String remove(Model model, @PathVariable("productId") int productId, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = this.exists(productId, cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "redirect:/cart";
    }

    @RequestMapping(value = "update-quantity/{productId}", method = RequestMethod.POST)
    public String updateQuantity(Model model, @ModelAttribute("quantity") int quantity, @PathVariable("productId") int productId, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = this.exists(productId, cart);
        if (quantity <= 0) {
            cart.get(index).setQuantity(1);
        } else {
            cart.get(index).setQuantity(quantity);
        }
        session.setAttribute("cart", cart);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "redirect:/cart";
    }

    @RequestMapping(value = "order-product-quantity/{productId}")
    public String orderWithQuantity(Model model,
            @ModelAttribute("quantity") int quantity,
            @PathVariable("productId") int productId,
            HttpSession session) {
        ProductEntity product = productService.findProductById(productId);
        List<PromotionDetailEntity> promotionDetails
                = promotionDetailService.getDetailPromotionByProductId(productId);
        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            if (!CollectionUtils.isEmpty(promotionDetails)) {
                for (PromotionDetailEntity promotionDetail : promotionDetails) {
                    cart.add(new Item(product, quantity, promotionDetail.getPromotion().getDiscountValue()));
                }
            } else {
                cart.add(new Item(product, quantity, 0));
            }
            session.setAttribute("cart", cart);
        } else {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = this.exists(productId, cart);

            if (index == -1) {
                if (!CollectionUtils.isEmpty(promotionDetails)) {
                    for (PromotionDetailEntity promotionDetail : promotionDetails) {
                        cart.add(new Item(product, quantity, promotionDetail.getPromotion().getDiscountValue()));
                    }
                } else {
                    cart.add(new Item(product, quantity, 0));
                }
            } else {
                quantity = cart.get(index).getQuantity() + quantity;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        if (product != null && product.getId() > 0) {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            double totalPrice = 0;
            if (!CollectionUtils.isEmpty(cart)) {
                for (Item item : cart) {
                    totalPrice = totalPrice + (1 - item.getDiscount()) * (item.getProduct().getProductPrice() * item.getQuantity());
                }
            }
            List<BrandEntity> listBrand = brandService.getBrands();
            model.addAttribute("listBrand", listBrand);
            model.addAttribute("sessionCart", session.getAttribute("cart"));
            model.addAttribute("totalPrice", totalPrice);
            AccountEntity account = (AccountEntity) session.getAttribute("account");
            model.addAttribute("accountSession", account);
            return "cart";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "check-out", method = RequestMethod.GET)
    public String checkOut(Model model, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        double totalPrice = 0;
        if (!CollectionUtils.isEmpty(cart)) {
            for (Item item : cart) {
                totalPrice = totalPrice + (1 - item.getDiscount()) * (item.getProduct().getProductPrice() * item.getQuantity());
            }
        }
        OrdersEntity ordersEntity = new OrdersEntity();
        ordersEntity.setTotalPrice(totalPrice);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        model.addAttribute("sessionCart", cart);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("orders", ordersEntity);
        return "checkout";
    }

    @RequestMapping(value = "/check-out-finish", method = RequestMethod.POST)
    public String checkOutFinish(Model model,
            @ModelAttribute("orders") OrdersEntity ordersEntity,
            HttpSession session) throws MessagingException {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        double totalPrice = 0;
        if (!CollectionUtils.isEmpty(cart)) {
            for (Item item : cart) {
                totalPrice = totalPrice + (1 - item.getDiscount()) * (item.getProduct().getProductPrice() * item.getQuantity());
            }
        }
        Date today = new Date();
        Date shipday = new Date(today.getTime() + (3 * 1000 * 60 * 60 * 24));
        ordersEntity.setOrderDate(today);
        ordersEntity.setShipDate(shipday);
        ordersEntity.setTotalPrice(totalPrice);
        ordersEntity.setStatus("ordered");
        if (account != null) {
            ordersEntity.setAccount(account);
        }
        ordersService.save(ordersEntity);
        ordersDetailService.save(ordersEntity, cart);

        SimpleDateFormat DateFor = new SimpleDateFormat("MM/dd/yyyy");
        String stringOrderDate = DateFor.format(today);
        String stringShipDate = DateFor.format(shipday);

        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        String totalMoney = currencyVN.format(ordersEntity.getTotalPrice());

        StringBuilder text = new StringBuilder("");
        int stt = 1;
        for (Item item : cart) {
            double x = item.getProduct().getProductPrice();
            double y = item.getQuantity() * item.getProduct().getProductPrice() * (1 - item.getDiscount());
            String price = currencyVN.format(x);
            String intoMoney = currencyVN.format(y);
            String discountDouble = String.valueOf(item.getDiscount() * 100);
            String[] parts = discountDouble.split("[.]");
            String discount = parts[0] + " %";
            text.append("<tr> \n"
                    + "<td>" + stt++ + "</td>\n"
                    + "<td>" + item.getProduct().getProductName() + "</td>\n"
                    + "<td>" + item.getQuantity() + "</td>\n"
                    + "<td>" + discount + "</td>\n"
                    + "<td>" + price + "</td>\n"
                    + "<td>" + intoMoney + "</td>\n"
                    + "</tr>\n");
        }
        String link = "http://localhost:8080/Spring_Project_Final/verify/" + ordersEntity.getId();

        mailSevice.sendEmail(ordersEntity.getEmail(), "MCSHOP - Check Your Order", "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "<style>\n"
                + "#text {\n"
                + "color:#4CAF50;\n"
                + "font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n"
                + "font-size: 150%; \n"
                + "font-style: inherit\n"
                + "}\n"
                + "#tittle {\n"
                + "color:#4CAF50;\n"
                + "text-align:center; \n"
                + "  font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n"
                + "font-size: 200%; \n"
                + "font-style: italic\n"
                + "}\n"
                + "#customers {\n"
                + "  font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n"
                + "  border-collapse: collapse;\n"
                + "  width: 100%;\n"
                + "}\n"
                + "\n"
                + "#customers td, #customers th {\n"
                + "  border: 1px solid #ddd;\n"
                + "  padding: 8px;\n"
                + "}\n"
                + "\n"
                + "\n"
                + "#customers th {\n"
                + "  padding-top: 12px;\n"
                + "  padding-bottom: 12px;\n"
                + "  text-align: left;\n"
                + "  background-color: #4CAF50;\n"
                + "  color: white;\n"
                + "}\n"
                + "</style>\n"
                + "</head>\n"
                + "<body>\n"
                + "<h2 id=\"tittle\">ORDER INFORMATION</h2>\n"
                + "<p id=\"text\">Order Date: " + stringOrderDate + "</p>\n"
                + "<p id=\"text\">Ship Date: " + stringShipDate + "</p>\n"
                + "<br>"
                + "<table id=\"customers\">\n"
                + "<tr>\n"
                + "        <th>ID</th>\n"
                + "        <th>Product</th>\n"
                + "        <th>Quantity</th>\n"
                + "        <th>Discount</th>\n"
                + "        <th>Price</th>\n"
                + "        <th>Into money</th>\n"
                + "</tr>\n"
                + text
                + "<tr>\n"
                + "<td style=\"text-align: right ; font-weight: bold\" colspan=\"5\">Total Price</td>\n"
                + "<td>" + totalMoney + "</td>"
                + "  </tr>\n"
                + "</table>\n"
                + "<p id=\"text\" style=\"text-align:center\">Thank you for shopping at MC-Shop !!!</p>\n"
                + "<h4 style=\"text-align:center\"><a href=\"" + link + "\">Please click on this link to confirm your order</a></h4>"
                + "</body>\n"
                + "</html>");
        session.removeAttribute("cart");
        model.addAttribute("accountSession", account);
        return "thanks";
    }

    @RequestMapping(value = "/verify/{ordersId}")
    public String verifyEmail(Model model,
            @PathVariable("ordersId") int ordersId,
            HttpSession session) {
        OrdersEntity ordersEntity = ordersService.findOrdersById(ordersId);
        ordersEntity.setStatus("confirmed");
        ordersService.save(ordersEntity);
        int num = 1;
        model.addAttribute("num", num);
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        model.addAttribute("accountSession", account);
        return "thanks";
    }
}
