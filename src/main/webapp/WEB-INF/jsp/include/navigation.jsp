<%-- 
    Document   : MC-Project
    Finished   : 25/07/2020
    Author     : Nguyen Ngoc Man
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li><a href="<c:url value="/about-us"/>">About us</a></li>
                <c:forEach var="brand" items="${listBrand}">
                <li><a href="#">${brand.brandName}</a></li>
                </c:forEach>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->