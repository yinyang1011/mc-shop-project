<%-- 
    Document   : cart
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : Man
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
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
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title text-center">
                        <h3 class="title">Your Orders</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <th>Option</th>
                                <th>Name</th>
                                <th>Brand</th> 
                                <th>Images</th>
                                <th>Price</th>
                                <th>Discount</th>
                                <th>Quantity</th>
                                <th>Into money</th>
                            </tr>
                            <c:forEach var="item" items="${sessionCart}">
                                    <tr>
                                        <td align="center"><a
                                                href="${pageContext.request.contextPath}/remove-product/${item.product.id}"
                                            onclick="return confirm('Are you sure?')"><i class="fa fa-trash fa-3x" aria-hidden="true"></i></a></td>
                                    <td>${item.product.productName}</td>
                                    <td>${item.product.brand.brandName}</td>
                                    <td style="text-align: center"><img style="width: 120px" src="<c:url value="/${item.product.productUrlImage}"/>"></td>

                                    <td><fmt:formatNumber type="number" value = "${item.product.productPrice}" pattern="###,###" />₫</td>
                                    <td>${item.discount}</td>                                 
                                    <td>
                                        <form method="POST" action="${pageContext.request.contextPath}/update-quantity/${item.product.id}" class="form-inline">
                                            <div class="form-group">
                                                <input type="number" name="quantity" class="form-control" value="${item.quantity}"/>
                                                <div style="text-align: center">
                                                <input type="image" src="<c:url value="/resources/img/save.png"/>" alt="submit" width="45" height="45"/>
                                                </div>
                                            </div>
                                        </form>
                                    </td>
                                    <td><fmt:formatNumber type="number" value = "${item.product.productPrice * item.quantity * (1 - item.discount)}" pattern="###,###" />₫</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td style="text-align: right ; font-weight: bold" colspan="7">Total amount:</td>
                                <td>
                                    <fmt:formatNumber type="number" value = "${totalPrice}" pattern="###,###" />₫
                                </td>
                            </tr>
                        </table>
                    </div>                    
                    <button onclick="location.href = '<c:url value="/check-out"/>'" style="float : right" type="button" class="btn btn-primary btn-lg">Submit</button>
                </div>
            </div>

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
