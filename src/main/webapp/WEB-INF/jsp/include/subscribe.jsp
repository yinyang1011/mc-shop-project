<%-- 
    Document   : MC-Project
    Finished   : 25/07/2020
    Author     : Nguyen Ngoc Man
--%>
<div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form method="POST" action="${pageContext.request.contextPath}/sendemail" class="form-inline" id="form1">
                                <input class="input" name="email" type="email" placeholder="Enter Your Email"
                                       required title="Mail must include an @ character, the domain name must be correct">
                                <button type="submit" form="form1" class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a target="_blank" href="https://www.facebook.com/my.cua11/"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a target="_blank" href="https://www.facebook.com/my.cua11/"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a target="_blank" href="https://www.facebook.com/my.cua11/"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a target="_blank" href="https://www.facebook.com/my.cua11/"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>