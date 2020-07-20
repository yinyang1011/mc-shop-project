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
        <title>About Us Page</title>
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
                        <li class="active"><a href="<c:url value="/about-us"/>">About us</a></li>
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
                        <h3 class="title">About Us</h3>
                        <p></p>
                        <b>Welcome customers to the MC-SHOP sales website. Here we specialize in selling fake products at unbelievably expensive prices.</b>
                    </div>
                    <div>
                        <p>
                            Our website and services are secure, protecting every bit of your personal information. Every sold laptop, tablet and smartphone are individually processed. We permanently erase any customer data.
                            <br />
                            We pay more for laptops and electronic gadgets. Some other websites try to pay a little as possible to make their profit margin as large as possible, while our quotes are very fair and reflect the market value. It is our mission to create a customer-friendly place that’s not driven by greed where people can recycle electronic gadgets and be happy with their experience.
                            <br />
                            We strive to satisfy your needs and make sure that you’ll come back. We make customers for life.
                            <br />
                            You can sell us your old laptop and use the money to buy a new one. Get quick cash for your laptop, tablet, or other electronic device!
                            <br />
                            Our online quotes are very precise for good or even broken laptops and other devices.
                            <br />
                            The process of selling laptops, iPhones and other electronic devices to us is extremely safe and easy. We’ve perfected our routine over the years to deliver the most convenient way to sell used computers quickly.
                            <br />
                            We value your time and our service is fast! You’re ready to ship instantly after submitting an order on the website. As soon as we receive your device, we process it and pay you the same day with a PayPal transfer or check in the mail.
                            <br />
                            Free shipping. Every time you sell us your laptop, iPhone, tablet, or smartphone we pay for safe, easy shipping via UPS. We e-mail you a pre-paid shipping label, you just box up your items to sell us and drop the box off at the nearest UPS store. You don’t need to spend a dime on shipping services! We stopped sending empty boxes in 2015 due to our continued desire to reduce waste and trash. Thanks to the change, we offer even more money for laptops and smartphones and our turnaround time is cut in half.
                            <br />
                            Most importantly, our desire to recycle electronics is driven by our mission to protect the natural environment by reducing e-waste. We make sure that all of the good parts from laptops and electronics that we process will be reused. Any of the broken or unusable ones are recycled in the best possible manner.
                            <br />
                            Being a family-owned company, we pride ourselves on providing honest business practices.
                            <br />
                            We focus on customer satisfaction. Since the beginning of our operation, we maintain great customer ratings with companies such as the BBB and are available via social media services. Sell us your laptop and help us build a better future of online trading.
                            <br />
                            Broken laptop? Broken iPhone? No problem! We’ll still buy broken laptops, broken iPhones, broken tablets, and other broken electronics.
                        </p>
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
