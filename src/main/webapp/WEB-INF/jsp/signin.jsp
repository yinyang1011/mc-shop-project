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
                <c:choose>
                    <c:when test = "${accountSession != null}">
                        <div class="section-title text-center">
                            <h3 style="color:green">Hello ${accountSession.email}</h3>
                        </div>
                        <div style="text-align: center">
                            <a class="primary-btn cta-btn" href="<c:url value="/"/>">Go home page</a>
                            <a class="primary-btn cta-btn" href="<c:url value="/information"/>">Edit Information</a>
                            <a class="primary-btn cta-btn" href="<c:url value="/owner-orders"/>">Manage Owner Orders</a>
                            <a class="primary-btn cta-btn" href="<c:url value="/favorite"/>">Favorite Products</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-12">
                            <div class="section-title text-center">
                                <h3 class="title">SIGN IN</h3>
                                <h3 style="color:red">${message}</h3>
                            </div>
                        </div>
                        <form method="POST" action="${pageContext.request.contextPath}/check-login">
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" id="password" placeholder="Enter password">
                            </div>
                            <input type="submit" class="btn btn-primary" value="Sign In">
                            <button style="float:right" onclick="location.href = '<c:url value="/register"/>'" type="button" class="btn btn-danger">Register</button>
                        </form>
                    </c:otherwise>
                </c:choose>
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
