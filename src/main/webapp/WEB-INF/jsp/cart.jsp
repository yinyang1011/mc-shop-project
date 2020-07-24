<%-- 
    Document   : cart
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : Man
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                                    <td>
                                        <fmt:formatNumber type="number" value = "${item.discount * 100}" pattern="###" /> %
                                    </td>                                 
                                    <td>
                                        <form method="POST" action="${pageContext.request.contextPath}/update-quantity/${item.product.id}" class="form-inline">
                                            <div class="form-group" style="display:flex">
                                                <input type="number" name="quantity" class="form-control" value="${item.quantity}"/>
                                                <input type="image" src="<c:url value="/resources/img/save.png"/>" alt="submit" width="35" height="35"/>
                                            </div>
                                        </form>
                                    </td>
                                    <td><fmt:formatNumber type="number" value = "${item.product.productPrice * item.quantity * (1 - item.discount)}" pattern="###,###" />₫</td>
                                </tr>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${sessionCart == null || fn:length(sessionCart) <= 0}">
                                    <tr>
                                        <td style="color: red;font-weight: bold;text-align: center" colspan="8">You have not added any items to your shopping cart!</td>
                                    </tr>
                                    <tr>
                                        <td style="color: red;font-weight: bold;text-align: center" colspan="8"><button onclick="location.href = '<c:url value="/store"/>'" type="button" class="btn btn-success btn-lg">Go to Shopping page!</button></td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td style="text-align: right ; font-weight: bold" colspan="7">Total amount:</td>
                                        <td>
                                            <fmt:formatNumber type="number" value = "${totalPrice}" pattern="###,###" />₫
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </table>
                    </div>                    
                    <button onclick="location.href = '<c:url value="/check-out"/>'" style="float : right" type="button" class="btn btn-primary btn-lg">Submit</button>
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
