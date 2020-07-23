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
        <title>Account Page</title>
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
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h3 class="title">TABLE OWNER ORDERS</h3>
                    </div>
                </div>
                <div>
                    <div>
                        <table class="table table-bordered">
                            <tr class="success">
                                <th>Orders Id</th>
                                <th>Order Date</th> 
                                <th>Ship Date</th>
                                <th>Status</th>
                                <th>Total Price</th>
                            </tr>
                            <c:forEach var="order" items="${listOrders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.orderDate}</td>
                                    <td>${order.shipDate}</td>
                                    <td>${order.status}</td>
                                    <td><fmt:formatNumber type="number" value = "${order.totalPrice}" pattern="###,###" />₫</td>         
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- NEWSLETTER -->
        <jsp:include page="include/subscribe.jsp"/>
        <!-- /NEWSLETTER -->
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
