<%-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>



<!DOCTYPE html>
<html lang="en">
<head>
    <title>LemonMe</title>
    <!-- head -->
    <%@include file="parts/head.jsp" %>
    <!-- head end -->
    <!-- css -->
    <%@include file="parts/css.jsp" %>
    <!-- css end -->
    <!-- js -->
    <%@include file="parts/head_js.jsp" %>
    <!-- js end -->
</head>
<body>

<!-- full container -->
<div id="colorlib-page">

    <!-- navbar -->
    <%@include file="parts/navbar.jsp" %>
    <!-- navbar end -->

    <!-- inizio pagina -->
    <div id="colorlib-main">

        <!-- inizio contenuto -->
        <!--
        <section class="ftco-section-no-padding bg-light">
            <div class="hero-wrap">
                <div class="overlay"></div>
                <div class="d-flex align-items-center js-fullheight">
                    <div class="author-image text img d-flex">
                        <section class="home-slider js-fullheight owl-carousel">
                            <div class="slider-item js-fullheight" style="background-image: url(res/images/author.jpg);">
                            </div>

                            <div class="slider-item js-fullheight" style="background-image:url(res/images/author-2.jpg);">
                            </div>
                        </section>
                    </div>
                    <div class="author-info text p-3 p-md-5">
                        <div class="desc">
                            <span class="subheading">Hello! I'm</span>
                            <h1 class="big-letter">Louie Smith</h1>
                            <h1 class="mb-4"><span>Louie Smith</span> A Photographer. <span>I Capture Life</span></h1>
                            <p class="mb-4">I am A Photographer from America Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            <h3 class="signature h1">Louie Smith</h3>
                            <ul class="ftco-social mt-3">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section instagram">
            <div class="container">
                <div class="row justify-content-center mb-2 pb-3">
                    <div class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
                        <h2 class="mb-4">Follow me on Instagram</h2>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="res/images/image_1.jpg" class="insta-img image-popup" style="background-image: url(res/images/image_1.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="res/images/image_2.jpg" class="insta-img image-popup" style="background-image: url(res/images/image_2.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="res/images/image_3.jpg" class="insta-img image-popup" style="background-image: url(res/images/image_3.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="res/images/image_4.jpg" class="insta-img image-popup" style="background-image: url(res/images/image_4.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="res/images/image_5.jpg" class="insta-img image-popup" style="background-image: url(res/images/image_5.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        -->
        <!-- fine contenuto -->

<!-- footer -->
    <%@include file="parts/footer.jsp" %>
<!-- footer end -->


    </div><!-- END COLORLIB-MAIN -->
    <!-- fine pagina -->


</div><!-- END COLORLIB-PAGE -->
<!-- full container end -->

<!-- loader -->
    <%@include file="parts/loader_end.jsp" %>
<!-- loader end-->
<!-- script js -->
<%@include file="parts/footer_js.jsp" %>
<!-- script js end -->
</body>
</html>