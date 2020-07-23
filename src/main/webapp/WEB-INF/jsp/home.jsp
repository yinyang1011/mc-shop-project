<%-- 
    Document   : home
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : Ngoc Man
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <jsp:include page="include/css-page.jsp" />
    </head>
    <body>
        <!-- header -->
        <jsp:include page="include/header.jsp"/>
        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="<c:url value="/"/>">Home</a></li>
                        <li><a href="<c:url value="/store"/>">Store</a></li>
                            <c:forEach var="brand" items="${listBrand}">
                            <li><a href="<c:url value="/store-detail/${brand.id}"/>">${brand.brandName}</a></li>
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

        <!-- SECTION -->
        <div class="section">

            <!-- container promotion -->
            <div class="container">
                <div class="row">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <c:forEach var = "i" begin = "0" end = "${countImage-1}">
                                <li data-target="#myCarousel" data-slide-to="${i}"></li>
                                </c:forEach>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <a href="<c:url value="/promotion"/>">
                                <img src="<c:url value="/${imageIndex.urlImage}"/>" >
                                </a>
                            </div> 
                            <c:forEach var="image" items="${images}">                     
                                <div class="item">
                                    <a href="<c:url value="/promotion"/>">
                                    <img src="<c:url value="/${image.urlImage}"/>" >
                                    </a>
                                </div>    
                            </c:forEach>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>    
            </div>   
            <!-- /container promotion -->

            <!-- container product -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Ours Products</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <c:forEach var="product" items="${products}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="<c:url value="${product.productUrlImage}"/>" height="200px">
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
                                                                <div class="product-label">
                                                                    <del class="product-old-price">
                                                                        <fmt:formatNumber type="number" value="${product.productPrice}"                                                       
                                                                                          pattern="###,###"/>₫ </del>

                                                                </div>
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
                                                    <button class="add-to-cart-btn" onclick="location.href = '<c:url value="/order-product/${product.id}"/>'"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>                                          
                                            </div>
                                        </c:forEach>  
                                        <!-- /product  -->

                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container product -->
        </div>
        <!-- /SECTION -->

        <!-- GO STORE SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>WE</h3>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>ARE</h3>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>MC - </h3>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>SHOP</h3>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">what are you waiting for ?</h2>
                            <p>GO TO SHOPPING NOW</p>
                            <a class="primary-btn cta-btn" href="<c:url value="/store"/>">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /GO STORE SECTION -->

        <!-- NEWSLETTER -->
        <jsp:include page="include/subscribe.jsp"/>
        <!-- /NEWSLETTER -->
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
