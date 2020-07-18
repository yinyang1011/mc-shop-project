<%-- 
    Document   : home
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Store Page</title>
        <jsp:include page="include/css-page.jsp" />
    </head>
    <body>
        <!-- header -->
        <jsp:include page="include/header.jsp"/>
        <!-- nav -->
        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a href="<c:url value="/"/>">Home</a></li>
                        <li class="active"><a href="<c:url value="/store"/>">Store</a></li>
                        <li><a href="<c:url value="/about-us"/>">About us</a></li>
                            <c:forEach var="brand" items="${listBrand}">
                            <li><a href="<c:url value="/store-detail/${brand.id}"/>">${brand.brandName}</a></li>
                            </c:forEach>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
        <!-- content -->
        <!-- /SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <c:forEach var="brand" items="${listBrand}">
                                <div class="checkbox-filter">
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="brand-1">
                                        <label for="brand-1">
                                            <span></span>
                                            ${brand.brandName}
                                            <small>(???)</small>
                                        </label>
                                    </div> 
                                </div>
                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Price</h3>
                            <div class="price-filter">
                                <div id="price-slider"></div>
                                <div class="input-number price-min">
                                    <input id="price-min" type="number">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                                <span>-</span>
                                <div class="input-number price-max">
                                    <input id="price-max" type="number">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top selling</h3>
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/product01.png" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Category</p>
                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                </div>
                            </div>

                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/product02.png" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Category</p>
                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                </div>
                            </div>

                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/product03.png" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Category</p>
                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                    <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <!--                        <div class="col-md-12">
                                                    <div class="store-filter clearfix">
                                                        <div class="store-sort">
                                                            <label>
                                                                Sort By:
                                                                <select class="input-select">
                                                                    <option value="0">Popular</option>
                                                                    <option value="1">Position</option>
                                                                </select>
                                                            </label>
                        
                                                            <label>
                                                                Show:
                                                                <select class="input-select">
                                                                    <option value="0">20</option>
                                                                    <option value="1">50</option>
                                                                </select>
                                                            </label>
                                                        </div>
                                                        <ul class="store-grid">
                                                            <li class="active"><i class="fa fa-th"></i></li>
                                                            <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>-->
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="col-md-12">
                            <!-- product -->
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-4">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="<c:url value="${product.productUrlImage}"/>" height="200px">
                                            <c:forEach var="p" items="${listPromotion}">
                                                <c:if test = "${p.product.id == product.id}">
                                                    <div class="product-label">
                                                        <span class="sale">${p.promotion.discountValue * 100} %</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.brand.brandName}</p>
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>

                                            <c:forEach var="pn" items="${productListNPM}">
                                                <c:if test = "${pn.id == product.id}">
                                                    <h4 class="product-price"><fmt:formatNumber type="number" 
                                                                      value="${product.productPrice}"                                                       
                                                                      pattern="###,###"/>₫ 
                                                    </h4>
                                                </c:if>
                                            </c:forEach>

                                            <c:forEach var="p" items="${listPromotion}">
                                                <c:if test = "${p.product.id == product.id}">
                                                    <h4 class="product-price"><fmt:formatNumber type="number" 
                                                                      value="${product.productPrice * (1 - p.promotion.discountValue)}"                                                       
                                                                      pattern="###,###"/>₫ 
                                                        <del class="product-old-price">
                                                            <fmt:formatNumber type="number" value="${product.productPrice}"                                                       
                                                                              pattern="###,###"/>₫ </del>
                                                    </h4>
                                                </c:if>  
                                            </c:forEach>   
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                <button class="quick-view" onclick="location.href = '<c:url value="/detail-product/${product.id}"/>'"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn" onclick="location.href = '<c:url value="/order-product/${product.id}"/>'"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- /product --> 
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <!--                        <div class="col-md-12">
                                                    <div class="store-filter clearfix">
                                                        <span class="store-qty">Showing 20-100 products</span>
                                                        <ul class="store-pagination">
                                                            <li class="active">1</li>
                                                            <li><a href="#">2</a></li>
                                                            <li><a href="#">3</a></li>
                                                            <li><a href="#">4</a></li>
                                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>-->
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form method="POST" action="${pageContext.request.contextPath}/sendemail" class="form-inline" id="form1">
                                <input class="input" name="email" type="email" placeholder="Enter Your Email">
                                <button type="submit" form="form1" class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
