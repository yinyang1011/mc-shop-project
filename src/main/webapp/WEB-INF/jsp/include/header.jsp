<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +84-345-526-444</a></li>
                <li><a href="mailto:1011ngoc.man@gmail.com"><i class="fa fa-envelope-o"></i>1011ngoc.man@gmail.com</a></li>
                <li><a target="_blank" href="https://www.google.com/maps/place/571+N%C3%BAi+Th%C3%A0nh,+Ho%C3%A0+C%C6%B0%E1%BB%9Dng+Nam,+H%E1%BA%A3i+Ch%C3%A2u,+%C4%90%C3%A0+N%E1%BA%B5ng/@16.0309816,108.2206608,17z/data=!3m1!4b1!4m5!3m4!1s0x314219ee33413dc9:0xdea0d48c54660f7d!8m2!3d16.0309816!4d108.2228495"><i class="fa fa-map-marker"></i> 571 Nui Thanh Street</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> VND</a></li>
                <li><a href="#"><i class="fa fa-user-o"></i> Account</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="<c:url value="/"/>" class="logo">
                            <img src="<c:url value="/resources/img/logo.png"/>" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form id="search" name="search" method="POST" action="${pageContext.request.contextPath}/search">
                            <select name="searchId" class="input-select">
                                <option value="0">By Name</option>
                                <option value="1">By Ram</option>
                                <option value="2">By Processor</option>
                            </select>
                            <input type="text" name="searchStr" class="input" placeholder="Search here">
                            <button class="search-btn" type="submit" form="search" value="Submit">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div>
                            <a href="<c:url value="/cart"/>">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Cart</span>
                            </a>   
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->