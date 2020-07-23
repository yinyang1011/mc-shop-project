<%-- 
    Document   : detail
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>
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
                        <li><a href="<c:url value="/"/>">Home</a></li>
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

        <!-- Section 1 -->
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">                     
                        <div id="product-main-img">
                            <c:forEach var="image" items="${listImages}">
                                <div class="product-preview">
                                    <img src="<c:url value="/${image.urlImage}"/>" height="300px" alt="">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <c:forEach var="image" items="${listImages}">
                                <div class="product-preview">
                                    <img src="<c:url value="/${image.urlImage}"/>" height="100px" alt="">
                                </div>
                            </c:forEach>    
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${product.productName}</h2>
                            <div>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>    
                            </div>
                            <div>
                                <c:forEach var="pn" items="${productListNPM}">
                                    <c:if test = "${pn.id == product.id}">
                                        <h3 class="product-price"><fmt:formatNumber type="number" 
                                                          value="${product.productPrice * (1 - p.promotion.discountValue)}"                                                       
                                                          pattern="###,###"/>₫ </h3>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach var="p" items="${listPromotion}">
                                        <c:if test = "${p.product.id == product.id}">
                                        <h3 class="product-price"><fmt:formatNumber type="number" 
                                                          value="${product.productPrice * (1 - p.promotion.discountValue)}"                                                       
                                                          pattern="###,###"/>₫ 
                                            (<fmt:formatNumber type="number" value = "${p.promotion.discountValue * 100}" pattern="###" /> %)
                                            <div class="product-label">
                                                <del class="product-old-price"><fmt:formatNumber type="number" 
                                                                  value="${product.productPrice}"                                                       
                                                                  pattern="###,###"/>₫</del>
                                            </div>
                                        </h3>
                                    </c:if>
                                </c:forEach>

                                <span class="product-available">In Stock</span>
                            </div>
                            <p>${product.productDescription}</p>

                            <div class="add-to-cart">
                                <div class="qty-label">
                                    <form method="POST" action="${pageContext.request.contextPath}/order-product-quantity/${product.id}" id="form">
                                        Qty
                                        <div class="input-number">
                                            <input type="number" name="quantity" class="form-control" value="1">
                                            <span class="qty-up">+</span>
                                            <span class="qty-down">-</span>
                                        </div>
                                    </form>
                                </div>
                                <button class="add-to-cart-btn" form="form" type="submit"><i class="fa fa-shopping-cart"></i> add to cart</button>
                            </div>

                            <ul class="product-btns">
                                <li><a href="#"><i class="fa fa-heart-o"></i> favorite</a></li>
                                <li><a href="<c:url value="/compare/${product.id}"/>"><i class="fa fa-exchange"></i> compare</a></li>
                            </ul>

                            <ul class="product-links">
                                <li>Brands:</li>
                                <li><a href="#">${product.brand.brandName}</a></li>
                            </ul>

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="https://www.facebook.com/my.cua11/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://www.facebook.com/my.cua11/"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://www.facebook.com/my.cua11/"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="https://www.facebook.com/my.cua11/"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                                <li><a data-toggle="tab" href="#tab2">Details</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>${product.productDescription}</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-striped">
                                                <tr class="success">
                                                    <th>Specifications</th>
                                                    <th>Values</th>
                                                </tr>
                                                <tr class="active">
                                                    <td>Processor Type</td>
                                                    <td>${product.processorType}</td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Hard Drive Capacity</td>
                                                    <td>${product.hardDriveCapacity}</td>
                                                </tr>
                                                <tr class="active">
                                                    <td>Processor Speed</td>
                                                    <td>${product.processorSpeed}</td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Wireless Technology</td>
                                                    <td>${product.wirelessTechnology}</td>
                                                </tr>
                                                <tr class="active">
                                                    <td>Ram Memory</td>
                                                    <td>${product.ramMemory}</td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Operating System</td>
                                                    <td>${product.operatingSystem}</td>
                                                </tr>
                                                <tr class="active">
                                                    <td>Battery</td>
                                                    <td>${product.battery}</td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Screen Size</td>
                                                    <td>${product.screenSize}</td>
                                                </tr>
                                                <tr class="active">
                                                    <td>Video Graphics Adaptor</td>
                                                    <td>${product.videoGraphicsAdaptor}</td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Weight</td>
                                                    <td>${product.weight}</td>
                                                </tr>
                                                <tr class="active">
                                                    <td>Brand</td>
                                                    <td>${product.brand.brandName}</td>
                                                </tr>                                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->                                
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- Section 1 -->

        <!-- SECTION 2 -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Related Products</h3>
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
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"onclick="location.href = '<c:url value="/compare/${product.id}"/>'"><i class="fa fa-exchange"></i><span class="tooltipp">compare</span></button>
                                                        <button class="quick-view" onclick="location.href = '<c:url value="/detail-product/${product.id}"/>'"><i class="fa fa-eye"></i><span class="tooltipp">view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" onclick="location.href = '<c:url value="/order-product/${product.id}"/>'"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                                </div>                                          
                                            </div>
                                        </c:forEach>  
                                        <!-- /product -->

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
            <!-- /container -->
        </div>
        <!-- /SECTION 2 -->
        <!-- NEWSLETTER -->
        <jsp:include page="include/subscribe.jsp"/>
        <!-- /NEWSLETTER -->
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
