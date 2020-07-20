<%-- 
    Document   : home
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : Ngoc Man
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanks Page</title>
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
                        <li><a href="<c:url value="/about-us"/>">About Us</a></li>
                            <c:forEach var="brand" items="${listBrand}">
                            <li><a href="<c:url value="/store-detail/${brand.id}"/>">${brand.brandName}</a></li>
                            </c:forEach>
                        <li class="active"><a href="#">Thanks page</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
        <!-- content -->
        <div class="row">
            <div class="col-sm-12">
                <div class="section-title text-center">
                    <c:choose>
                        <c:when test = "${num == 1}">
                            <h3 class="title">Your order has been confirmed!</h3>
                            <p><button onclick="location.href = '<c:url value="/store"/>'" type="button" class="btn btn-success btn-lg">Shopping More ? </button></p>
                        </c:when>
                        <c:otherwise>
                            <h3 class="title">Thank you for shopping at MC-Shop</h3>
                            <p><button onclick="location.href = '<c:url value="/store"/>'" type="button" class="btn btn-success btn-lg">Go to Shopping page!</button></p>
                        </c:otherwise>
                    </c:choose>

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
