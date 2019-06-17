<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container px-md-5">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-4">
                    <%--
                <h2 class="ftco-heading-2">Recent Photos</h2>
                <ul class="list-unstyled photo">
                    <li><a href="#" class="img" style="background-image: url(${ctx}/res/images/image_1.jpg);"></a></li>
                    <li><a href="#" class="img" style="background-image: url(${ctx}/res/images/image_2.jpg);"></a></li>
                    <li><a href="#" class="img" style="background-image: url(${ctx}/res/images/image_3.jpg);"></a></li>
                    <li><a href="#" class="img" style="background-image: url(${ctx}/res/images/image_4.jpg);"></a></li>
                    <li><a href="#" class="img" style="background-image: url(${ctx}/res/images/image_5.jpg);"></a></li>
                    <li><a href="#" class="img" style="background-image: url(${ctx}/res/images/image_6.jpg);"></a></li>
                </ul>
                --%>
                    <h2 class="ftco-heading-2">
                        <spring:message code="site.footer.changeLanguage"/>
                    </h2>
                    <div class="flags">
                        <span data-lang="it" class="flag-icon flag-icon-it"></span>
                        <span data-lang="en" class="flag-icon flag-icon-gb"></span>
                        <%-- <span data-lang="es" class="flag-icon flag-icon-es"></span>
                        <span data-lang="de" class="flag-icon flag-icon-de"></span>
                        <span data-lang="en" class="flag-icon flag-icon-us"></span> --%>
                    </div>
                </div>
            </div>
            <div class="col-md">
                <!--
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Archives</h2>
                    <ul class="list-unstyled categories">
                        <li><a href="#">November 2018 <span>(105)</span></a>
                        </li>
                        <li><a href="#">October 2018 <span>(212)</span></a></li>
                        <li><a href="#">September 2018 <span>(150)</span></a></li>
                        <li><a href="#">August 2018 <span>(100)</span></a></li>
                        <li><a href="#">July 2018 <span>(200)</span></a></li>
                    </ul>
                </div>
                -->
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Have a Questions? NO</h2>
                    <!--
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View,
                                    San Francisco, California, USA</span></li>
                            <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929
                                        210</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                        </ul>
                    </div>
                    -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    LemonMe Community
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </div>
</footer>