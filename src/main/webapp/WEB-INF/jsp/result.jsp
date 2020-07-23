<%-- 
    Document   : home
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <li><a href="<c:url value="/store"/>">Store</a></li>
                            <c:forEach var="brand" items="${listBrand}">
                                <c:choose>
                                    <c:when test = "${brand.id == brandId}">
                                    <li class="active"><a href="<c:url value="/store-detail/${brand.id}"/>">${brand.brandName}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="<c:url value="/store-detail/${brand.id}"/>">${brand.brandName}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        <li><a href="<c:url value="/about-us"/>">About us</a></li>
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
                            <h3 class="aside-title">Top selling</h3>
                            <c:forEach var="product" items="${productListHot}">
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="<c:url value="/${product.productUrlImage}"/>" >
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${product.brand.brandName}</p>
                                        <h3 class="product-name"><a href="<c:url value="/detail-product/${product.id}"/>">${product.productName}</a></h3>
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
                                                    <div class="product-label">
                                                        <del class="product-old-price">
                                                            <fmt:formatNumber type="number" value="${product.productPrice}"                                                       
                                                                              pattern="###,###"/>₫ </del>

                                                    </div>
                                                </h4>
                                            </c:if>  
                                        </c:forEach>  
                                    </div>
                                </div>  
                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store products -->
                        <c:if test="${listProducts == null || fn:length(listProducts) <= 0}">
                            <h3 style="color: red;font-weight: bold;text-align: center">${errorMessage}</h3>.
                        </c:if>
                        <div class="col-md-12">
                            <!-- product --> 
                            <c:forEach var="product" items="${listProducts}">
                                <div class="col-md-4">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="<c:url value="/${product.productUrlImage}"/>" height="200px">
                                            <c:forEach var="p" items="${listPromotion}">
                                                <c:if test = "${p.product.id == product.id}">
                                                    <div class="product-label">
                                                        <span class="sale" style="font-weight:bold;font-size:150%">
                                                            <fmt:formatNumber type="number" value = "${p.promotion.discountValue * 100}" pattern="###" /> %
                                                        </span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${product.brand.brandName}</p>
                                            <h3 class="product-name"><a href="<c:url value="/detail-product/${product.id}"/>">${product.productName}</a></h3>

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
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">favorite</span></button>
                                                <button class="add-to-compare"onclick="location.href = '<c:url value="/compare/${product.id}"/>'"><i class="fa fa-exchange"></i><span class="tooltipp">compare</span></button>
                                                <button class="quick-view" onclick="location.href = '<c:url value="/detail-product/${product.id}"/>'"><i class="fa fa-eye"></i><span class="tooltipp">view</span></button>
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
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <jsp:include page="include/subscribe.jsp"/>
        <!-- /NEWSLETTER -->
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
