<%-- 
    Document   : check out
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
        <title>Payment Page</title>
        <jsp:include page="include/css-page.jsp" />
        <script>
            function message() {
                alert("Thank you and please check order in your mail !!");
            }

            function kiemTraRemail() {
                //Lấy biến frm từ form
                var frm = document.forms["confirm"];
                //Kiểm tra Email
                var email = frm["email"].value;
                //abc@gmail.com
                var atpos = email.indexOf("@"); //Thì hàm này sẽ trả về giá trị là 3. a=0 , b=1,c=2 và @ là 3
                var atpos2 = email.lastIndexOf("@");//Nếu có 1 chữ @ thì 2 giá trị atpos sẽ bằng nhau.
                var dotpos = email.lastIndexOf(".");

                if (atpos > 0 && atpos == atpos2 && dotpos > atpos && (email.length - 1 - dotpos) >= 2) // dotpos > atpos tức là . phải nằm sau @ tức là giá trị đếm từ trái sang phải của . sẽ lớn hơn
                {
                    return true;
                } else {
                    alert("Định dạng mail không hợp lệ");
                    return false;
                }
                return true;
            }

        </script>
    </head>
    <body>
        <!-- header -->
        <jsp:include page="include/header.jsp"/>
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Checkout</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="<c:url value="/"/>">Home</a></li>
                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- content -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <div class="section-title">
                                <h3 class="title">Billing address</h3>
                            </div>
                            <mvc:form id="confirm" name="confirm" method="POST" modelAttribute="orders"
                                      action="${pageContext.request.contextPath}/check-out-finish" onsubmit="return message();">
                                <div class="form-group">
                                    <input class="input" type="text" name="firstName" placeholder="First Name" value="${orders.firstName}" 
                                           required title="Tên nên viết liền không dấu và không bao gồm số">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="lastName" placeholder="Last Name" value="${orders.lastName}" 
                                           required title="Tên nên viết liền không dấu và không bao gồm số">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" name="email" placeholder="Email" value="${orders.email}" 
                                           required title="Mail phải bao gồm ký tự @, tên miền phải chính xác">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Address" value="${orders.address}" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" name="phone" placeholder="Telephone" value="${orders.phone}" required
                                           pattern="[0-9].{9}$" title="Số điện thoại chỉ bao gồm số và có 10 chữ số!">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="idCard" placeholder="Card ID" value="${orders.idCard}" required
                                           pattern="[0-9].{9}$" title="Số chứng minh nhân dân chỉ bao gồm số và có 10 chữ số!">
                                </div>
                                <div class="form-group">
                                    <label for="birthDate">Birth Date</label>
                                    <input class="input" type="date" name="birthDate" id="birthDate" value="${orders.birthDate}">
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
                            </mvc:form>
                        </div>
                        <!-- /Billing Details -->
                    </div>

                    <!-- Order Details -->
                    <div class="col-md-5 order-details">
                        <div class="section-title text-center">
                            <h3 class="title">Your Order</h3>
                        </div>
                        <div class="section-title text-center">
                            <h4 class="title" style="color: darkseagreen">(Please check the order information.)</h4>
                        </div>
                        <div class="order-summary">
                            <div class="order-col">
                                <div><strong>PRODUCT</strong></div>
                                <div><strong>UNIT PRICE</strong></div>                    
                            </div>
                            <!-- 1 -->
                            <c:forEach var="item" items="${sessionCart}">
                                <div class="order-products">
                                    <div class="order-col">
                                        <div>${item.quantity} x ${item.product.productName}</div>
                                        <div><fmt:formatNumber type="number" value="${item.product.productPrice * item.quantity * (1 - item.discount)}"                                                       
                                                          pattern="###,###"/>₫</div>
                                    </div>    
                                </div>
                            </c:forEach>
                            <div class="order-col">
                                <div>Shiping</div>
                                <div><strong>FREE</strong></div>
                            </div>

                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div><strong class="order-total"><fmt:formatNumber type="number" value="${totalPrice}"                                                       
                                                  pattern="###,###"/>₫</strong></div>
                            </div>
                        </div>
                        <div style="text-align: center">
                            <div style="display: inline-block">
                                <button type="submit" form="confirm" value="Submit" class="primary-btn order-submit">Place order</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <jsp:include page="include/subscribe.jsp"/>
        <!-- /NEWSLETTER -->
        <!-- footer -->
        <jsp:include page="include/footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
