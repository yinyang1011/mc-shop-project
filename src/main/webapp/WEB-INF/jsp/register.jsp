<%-- 
    Document   : home
    Created on : Jun 20, 2019, 6:59:56 PM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <jsp:include page="include/css-page.jsp" />
        <script>
            function message() {
                alert("Thank you and please check mail to verify Account !!");
            }
        </script>
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
                        <h3 class="title">SIGN UP</h3>
                        <h3 style="color:red">${message}</h3>
                    </div>
                </div>
                <div class="col-md-12">
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <c:choose>
                            <c:when test = "${accountSession != null}">
                                <mvc:form id="editinfor" name="editinfor" method="POST" modelAttribute="account"
                                          action="${pageContext.request.contextPath}/edit-infor">
                                    <div class="form-group">
                                        <input class="input" type="text" name="firstName" placeholder="First Name" value="${accountSession.firstName}" 
                                               required title="Tên nên viết liền không dấu và không bao gồm số">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="lastName" placeholder="Last Name" value="${accountSession.lastName}" 
                                               required title="Tên nên viết liền không dấu và không bao gồm số">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="email" name="email" placeholder="Email" value="${accountSession.email}" 
                                               readonly>
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="password" name="password" placeholder="Password" 
                                               required title="Mật khẩu phải đủ mạnh.">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="address" placeholder="Address" value="${accountSession.address}" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="tel" name="phone" placeholder="Telephone" value="${accountSession.phone}" required
                                               pattern="[0-9].{9}$" title="Số điện thoại chỉ bao gồm số và có 10 chữ số!">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="idCard" placeholder="Card ID" value="${accountSession.idCard}" required
                                               pattern="[0-9].{9}$" title="Số chứng minh nhân dân chỉ bao gồm số và có 10 chữ số!">
                                    </div>
                                    <div class="form-group">
                                        <label for="birthDate">Birth Date</label>
                                        <input class="input" type="date" name="birthDate" id="birthDate" value="${accountSession.birthDate}">
                                    </div>
                                    <!-- Gender -->
                                    <c:choose>
                                        <c:when test = "${accountSession.gender eq 'male'}">
                                            <div class="form-group">
                                                <label for="gender">Gender</label>
                                                <div class="form-check">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="gender" id="male" value="male" checked>Male
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="gender" id="female" value="female">Female
                                                    </label>
                                                </div>                                  
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="form-group">
                                                <label for="gender">Gender</label>
                                                <div class="form-check">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="gender" id="male" value="male">Male
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="gender" id="female" value="female" checked>Female
                                                    </label>
                                                </div>                                  
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <!-- /Gender -->
                                    <div style="text-align: center">
                                        <button type="submit" form="editinfor" value="Submit"
                                                class="primary-btn order-submit">Accept Edit</button>
                                        <button type="button" onclick="location.href = '<c:url value="/account"/>'"
                                                class="primary-btn order-submit">Back</button>
                                    </div>
                                </mvc:form>
                            </c:when>
                            <c:otherwise>
                                <mvc:form id="register" name="register" method="POST" modelAttribute="account"
                                          action="${pageContext.request.contextPath}/register-finish" onsubmit="return message();">
                                    <div class="form-group">
                                        <input class="input" type="text" name="firstName" placeholder="First Name" value="${account.firstName}" 
                                               required title="Tên nên viết liền không dấu và không bao gồm số">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="lastName" placeholder="Last Name" value="${account.lastName}" 
                                               required title="Tên nên viết liền không dấu và không bao gồm số">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="email" name="email" placeholder="Email" value="${account.email}" 
                                               required title="Mail phải bao gồm ký tự @, tên miền phải chính xác">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="password" name="password" placeholder="Password" value="${account.password}" 
                                               required title="Mật khẩu phải đủ mạnh.">
                                    </div>       
                                    <div class="form-group">
                                        <input class="input" type="text" name="address" placeholder="Address" value="${account.address}" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="tel" name="phone" placeholder="Telephone" value="${account.phone}" required
                                               pattern="[0-9].{9}$" title="Số điện thoại chỉ bao gồm số và có 10 chữ số!">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="idCard" placeholder="Card ID" value="${account.idCard}" required
                                               pattern="[0-9].{9}$" title="Số chứng minh nhân dân chỉ bao gồm số và có 10 chữ số!">
                                    </div>
                                    <div class="form-group">
                                        <label for="birthDate">Birth Date</label>
                                        <input class="input" type="date" name="birthDate" id="birthDate" value="${account.birthDate}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Gender</label>
                                        <div class="form-check">
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" id="male" value="male">Male
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" id="female" value="female">Female
                                            </label>
                                        </div>                                  
                                    </div>
                                    <div style="text-align: center">
                                        <button type="submit" form="register" value="Submit"
                                                class="primary-btn order-submit">Register</button>
                                    </div>
                                </mvc:form>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <!-- /Billing Details -->
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
