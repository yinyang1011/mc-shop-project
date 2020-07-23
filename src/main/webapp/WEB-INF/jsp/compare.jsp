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
        <title>Compare Page</title>
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
                <!-- table compare  -->  
                <div id="tab2" class="tab-pane fade in">
                    <div class="row">
                        <h4 style="color:red;text-align: center">${messageError}</h4>
                        <!-- section title -->
                        <div class="col-md-12">
                            <div class="section-title text-center">
                                <h3 class="title">COMPARE TABLE</h3>
                            </div>
                        </div>
                        <!-- /section title -->
                        <div class="col-md-12">
                            <table class="table table-striped">
                                <tr class="success">
                                    <th></th>
                                    <th><a style="font-weight:bold" href="<c:url value="/detail-product/${p1.id}"/>">${p1.productName}</a></th>                              
                                    <th><a style="font-weight:bold" href="<c:url value="/detail-product/${p1.id}"/>">${p2.productName}</a></th>
                                </tr>
                                <tr class="active">
                                    <td>Image Product</td>
                                    <td><img style="width: 150px" src="<c:url value="/${p1.productUrlImage}"/>" alt=" Null"></td>
                                    <td><img style="width: 150px" src="<c:url value="/${p2.productUrlImage}"/>" alt=" Null"></td>
                                </tr>
                                <tr class="success">
                                    <td>Price</td>
                                    <td>
                                        <c:forEach var="pn" items="${productListNPM}">
                                            <c:if test = "${pn.id == p1.id}">
                                                <h4 class="product-price" style="color:red"><fmt:formatNumber type="number" 
                                                                  value="${p1.productPrice}"                                                       
                                                                  pattern="###,###"/>₫ 
                                                </h4>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="p" items="${listPromotion}">
                                            <c:if test = "${p.product.id == p1.id}">
                                                <h4 class="product-price" style="color:red"><fmt:formatNumber type="number" 
                                                                  value="${p1.productPrice * (1 - p.promotion.discountValue)}"                                                       
                                                                  pattern="###,###"/>₫ (<del class="product-old-price">
                                                                  <fmt:formatNumber type="number" value="${p1.productPrice}"                                                       
                                                                                    pattern="###,###"/>₫ </del>)

                                                </h4>
                                            </c:if>  
                                        </c:forEach>
                                    </td>
                                    <td><c:forEach var="pn" items="${productListNPM}">
                                            <c:if test = "${pn.id == p2.id}">
                                                <h4 class="product-price" style="color:red"><fmt:formatNumber type="number" 
                                                                  value="${p2.productPrice}"                                                       
                                                                  pattern="###,###"/>₫ 
                                                </h4>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="p" items="${listPromotion}">
                                            <c:if test = "${p.product.id == p2.id}">
                                                <h4 class="product-price" style="color:red"><fmt:formatNumber type="number" 
                                                                  value="${p2.productPrice * (1 - p.promotion.discountValue)}"                                                       
                                                                  pattern="###,###"/>₫ (<del class="product-old-price">
                                                                  <fmt:formatNumber type="number" value="${p2.productPrice}"                                                       
                                                                                    pattern="###,###"/>₫ </del>)

                                                </h4>
                                            </c:if>  
                                        </c:forEach></td>
                                </tr>
                                <tr class="active">
                                    <td>Discount</td>
                                    <td>
                                        <c:forEach var="p" items="${listPromotion}">
                                            <c:if test = "${p.product.id == p1.id}">
                                                <fmt:formatNumber type="number" value = "${p.promotion.discountValue * 100}" pattern="###" /> %
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td><c:forEach var="p" items="${listPromotion}">
                                            <c:if test = "${p.product.id == p2.id}">
                                                <fmt:formatNumber type="number" value = "${p.promotion.discountValue * 100}" pattern="###" /> %
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </tr>

                                <tr class="success">
                                    <td>Processor Type</td>
                                    <td>${p1.processorType}</td>
                                    <td>${p2.processorType}</td>
                                </tr>
                                <tr class="active">
                                    <td>Hard Drive Capacity</td>
                                    <td>${p1.hardDriveCapacity}</td>
                                    <td>${p2.hardDriveCapacity}</td>
                                </tr>
                                <tr class="success">
                                    <td>Processor Speed</td>
                                    <td>${p1.processorSpeed}</td>
                                    <td>${p2.processorSpeed}</td>
                                </tr>
                                <tr class="active">
                                    <td>Wireless Technology</td>
                                    <td>${p1.wirelessTechnology}</td>
                                    <td>${p2.wirelessTechnology}</td>
                                </tr>
                                <tr class="success">
                                    <td>Ram Memory</td>
                                    <td>${p1.ramMemory}</td>
                                    <td>${p2.ramMemory}</td>
                                </tr>
                                <tr class="active">
                                    <td>Operating System</td>
                                    <td>${p1.operatingSystem}</td>
                                    <td>${p2.operatingSystem}</td>
                                </tr>
                                <tr class="success">
                                    <td>Battery</td>
                                    <td>${p1.battery}</td>
                                    <td>${p2.battery}</td>
                                </tr>
                                <tr class="active">
                                    <td>Screen Size</td>
                                    <td>${p1.screenSize}</td>
                                    <td>${p2.screenSize}</td>
                                </tr>
                                <tr class="success">
                                    <td>Video Graphics Adaptor</td>
                                    <td>${p1.videoGraphicsAdaptor}</td>
                                    <td>${p2.videoGraphicsAdaptor}</td>
                                </tr>
                                <tr class="active">
                                    <td>Weight</td>
                                    <td>${p1.weight}</td>
                                    <td>${p2.weight}</td>
                                </tr>
                                <tr class="success">
                                    <td>Brand</td>
                                    <td>${p1.brand.brandName}</td>
                                    <td>${p2.brand.brandName}</td>
                                </tr>   
                                <tr class="active">
                                    <td>Remove</td>
                                    <td><c:if test = "${p1.id!=null}">
                                            <button class="btn btn-danger" onclick="location.href = '<c:url value="/remove-compare/${p1.id}"/>'"><i class="fa fa-ban"></i> REMOVE</button>
                                        </c:if></td>
                                    <td><c:if test = "${p2.id!=null}">
                                            <button class="btn btn-danger" onclick="location.href = '<c:url value="/remove-compare/${p2.id}"/>'"><i class="fa fa-ban"></i> REMOVE</button>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>Add to cart</td>
                                    <td><c:if test = "${p1.id!=null}">
                                            <button class="btn btn-success" onclick="location.href = '<c:url value="/order-product/${p1.id}"/>'"><i class="fa fa-shopping-cart"></i> ADD TO CART</button>                                        </c:if></td>
                                    <td><c:if test = "${p2.id!=null}">
                                            <button class="btn btn-success" onclick="location.href = '<c:url value="/order-product/${p2.id}"/>'"><i class="fa fa-shopping-cart"></i> ADD TO CART</button>                                        </c:if>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /table compare  -->  
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
