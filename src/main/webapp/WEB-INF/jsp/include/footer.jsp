<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Welcome customers to the MC-SHOP sales website.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-phone"></i>+84-345-526-444</a></li>
                            <li><a target="_blank" href="https://www.google.com/maps/place/571+N%C3%BAi+Th%C3%A0nh,+Ho%C3%A0+C%C6%B0%E1%BB%9Dng+Nam,+H%E1%BA%A3i+Ch%C3%A2u,+%C4%90%C3%A0+N%E1%BA%B5ng/@16.0309816,108.2206608,17z/data=!3m1!4b1!4m5!3m4!1s0x314219ee33413dc9:0xdea0d48c54660f7d!8m2!3d16.0309816!4d108.2228495"><i class="fa fa-map-marker"></i>571 Nui Thanh Street</a></li>
                            <li><a href="mailto:1011ngoc.man@gmail.com"><i class="fa fa-envelope-o"></i>1011ngoc.man@gmail.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Brand</h3>
                        <ul class="footer-links">
                            <li><a href="<c:url value="/store-detail/1"/>">MacBook</a></li>
                            <li><a href="<c:url value="/store-detail/2"/>">Asus</a></li>
                            <li><a href="<c:url value="/store-detail/3"/>">HP</a></li>
                            <li><a href="<c:url value="/store-detail/4"/>">Lenovo</a></li>
                            <li><a href="<c:url value="/store-detail/5"/>">Acer</a></li>
                            <li><a href="<c:url value="/store-detail/6"/>">Dell</a></li>
                            <li><a href="<c:url value="/store-detail/7"/>">Huawei</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="<c:url value="/about-us"/>">About Us</a></li>
                            <li><a href="<c:url value="/about-us"/>">Contact Us</a></li>
                            <li><a href="<c:url value="/about-us"/>">Privacy Policy</a></li>
                            <li><a href="<c:url value="/about-us"/>">Orders and Returns</a></li>
                            <li><a href="<c:url value="/about-us"/>">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">Account</a></li>
                            <li><a href="<c:url value="/cart"/>">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="<c:url value="/about-us"/>">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->