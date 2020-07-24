<%-- 
    Document   : MC-Project
    Finished   : 25/07/2020
    Author     : Nguyen Ngoc Man
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
                        <h3 class="title">TABLE FAVORITE PRODUCTS</h3>
                        <h3 style="color:red">${message}</h3>
                    </div>
                </div>
                <div>
                    <div>
                        <table class="table table-bordered">
                            <tr class="success">
                                <th>Action</th>
                                <th>Name</th> 
                                <th>Image</th>
                                <th>Price</th>
                                <th>Discount</th>
                                <th>Current Price</th>   
                            </tr>
                            <c:forEach var="product" items="${listProducts}">
                                <tr>
                                    <td align="center"><a
                                            href="${pageContext.request.contextPath}/remove-favorite-product/${product.id}"
                                            onclick="return confirm('Are you sure?')"><i class="fa fa-trash fa-3x" aria-hidden="true"></i></a></td>
                                    <td>${product.productName}</td>
                                    <td style="text-align: center"><img style="width: 120px" src="<c:url value="/${product.productUrlImage}"/>"></td>
                                    <td><fmt:formatNumber type="number" value = "${product.productPrice}" pattern="###,###" />₫</td>
                                    <td>
                                        <c:forEach var="p" items="${listPromotion}">
                                            <c:if test = "${p.product.id == product.id}">
                                                <fmt:formatNumber type="number" value = "${p.promotion.discountValue * 100}" pattern="###" /> %
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="pn" items="${productListNPM}">
                                            <c:if test = "${pn.id == product.id}">
                                                <p>0 %</p>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="pn" items="${productListNPM}">
                                            <c:if test = "${pn.id == product.id}">
                                                <h4 class="product-price" style="color:red"><fmt:formatNumber type="number" 
                                                                  value="${product.productPrice}"                                                       
                                                                  pattern="###,###"/>₫ 
                                                </h4>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="p" items="${listPromotion}">
                                            <c:if test = "${p.product.id == product.id}">
                                                <h4 class="product-price" style="color:red"><fmt:formatNumber type="number" 
                                                                  value="${product.productPrice * (1 - p.promotion.discountValue)}"                                                       
                                                                  pattern="###,###"/>₫
                                                </h4>
                                            </c:if>  
                                        </c:forEach>  
                                    </td>         
                                </tr>
                            </c:forEach>
                            <c:if test="${listProducts == null || fn:length(listProducts) <= 0}">
                                <tr>
                                    <td style="color: red;font-weight: bold;text-align: center" colspan="6">You have not added any product your favorite list!</td>
                                </tr>
                                <tr>
                                    <td style="color: red;font-weight: bold;text-align: center" colspan="6"><button onclick="location.href = '<c:url value="/account"/>'" type="button" class="btn btn-success btn-lg">Back</button></td>
                                </tr>
                            </c:if>
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
