<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lemon Me</title>
    <%@include file="segment/head_css.jsp" %>
</head>
<body>
<div id="colorlib-page">
    <%@include file="segment/aside.jsp" %>
    <div id="colorlib-main" style="padding-top: 0">
        <section class="ftco-section-no-padding bg-light">

            <div class="hero-wrap"> <%-- eliminare --%>

                <div class="overlay"></div>

                <div class="d-flex align-items-center js-fullheight">
                    <div class="author-image text img d-flex">
                        <section class="home-slider js-fullheight owl-carousel">
                            <div class="slider-item js-fullheight"
                                 style="background-image: url(${ctx}/res/images/author.jpg);">
                            </div>
                            <div class="slider-item js-fullheight"
                                 style="background-image:url(${ctx}/res/images/author-2.jpg);">
                            </div>
                        </section>
                    </div>

                    <div class="author-info text p-3 p-md-5 align-items-center">
                        <div class="desc">
                            <span class="subheading"><br></span>
                            <h1 class="big-letter h1-welcome" style="padding-top: -10rem">&emsp;LemonMe</h1>
                            <h1 class="mb-4 h1-description"><span>&emsp;<spring:message code="home.welcome"/></span>
                                <p class="limone">&emsp;&emsp;&emsp;LemonMe!</p></h1>
                            <c:if test="${loggedIn}">
                                <h1 class="mb-4" style="padding-top: 2rem"><a href="${ctx}/scopri"><span><spring:message code="home.limone"/>🍋</span></a></h1>
                            </c:if>
                            <c:if test="${not loggedIn}">
                                <h1 class="mb-4" style="padding-top: 2rem"><span><spring:message code="home.limone"/>🍋</span></h1>
                            </c:if>
                            <h3 class="signature h1-description font-italic justify-content-end"><span><spring:message code="home.love"/></span></h3>
                            <ul class="ftco-social mt-3 col-12" style="padding-top: 2rem;">
                                <li class="ftco-animate col-3 align-items-center" style="padding: 0rem 4.5rem; font-size: 1.5rem">😏</li>
                                <li class="ftco-animate col-3 align-items-center" style="padding: 0rem 4.5rem; font-size: 1.5rem">🍋</li>
                                <li class="ftco-animate col-3 align-items-center" style="padding: 0rem 4.5rem; font-size: 1.5rem">❤️</li>
                            </ul>
                        </div>
                        <!-- Registrazione Button -->
                        <div class="row block-9 align-items-center justify-content-center" style="padding-top: 3.5rem">
                            <c:if test="${not loggedIn}">
                                <a href="${ctx}/registrati" class="btn btn-primary-registrati py-3 px-5">
                                    <spring:message code="register.title"/></a>
                            </c:if>
                        </div>

                    </div>
                </div>


            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->
<%@include file="segment/loader.jsp" %>
<%@include file="segment/footer_js.jsp" %>
</body>
</html>


<%--
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lemon Me</title>
    <%@include file="segment/head_css.jsp" %>
</head>
<body>
<div id="colorlib-page">
    <%@include file="segment/aside.jsp" %>
    <div id="colorlib-main" style="padding-top: 0">
        <section class="ftco-section-no-padding bg-light">

            <div class="hero-wrap"> &lt;%&ndash; eliminare &ndash;%&gt;

                <div class="overlay"></div>

                <div class="d-flex align-items-center js-fullheight">
                    <div class="author-image text img d-flex">
                        <section class="home-slider js-fullheight owl-carousel">
                            <div class="slider-item js-fullheight"
                                 style="background-image: url(${ctx}/res/images/author.jpg);">
                            </div>
                            <div class="slider-item js-fullheight"
                                 style="background-image:url(${ctx}/res/images/author-2.jpg);">
                            </div>
                        </section>
                    </div>

                    <div class="author-info text p-3 p-md-5 align-items-center">
                        <div class="desc">
                            <span class="subheading"><br></span>
                            <h1 class="big-letter h1-welcome" style="padding-top: -10rem">&emsp;LemonMe</h1>
                            <h1 class="mb-4 h1-description"><span>&emsp;<spring:message code="home.welcome"/></span>
                                <p class="limone">&emsp;&emsp;&emsp;LemonMe!</p></h1>
                            <c:if test="${loggedIn}">
                                <h1 class="mb-4" style="padding-top: 2rem"><a href="${ctx}/scopri"><span><spring:message
                                        code="home.limone"/>🍋</span></a></h1>
                            </c:if>
                            <c:if test="${not loggedIn}">
                                <h1 class="mb-4" style="padding-top: 2rem"><span><spring:message
                                        code="home.limone"/>🍋</span></h1>
                            </c:if>
                            <h3 class="signature h1-description font-italic justify-content-end"><span><spring:message
                                    code="home.love"/></span></h3>
                            <ul class="ftco-social mt-3 col-12" style="padding-top: 2rem;">
                                <li class="ftco-animate col-3 align-items-center" style="padding: 0rem 4.5rem">😏</li>
                                <li class="ftco-animate col-3 align-items-center" style="padding: 0rem 4.5rem">🍋</li>
                                <li class="ftco-animate col-3 align-items-center" style="padding: 0rem 4.5rem">❤️</li>
                            </ul>
                        </div>
                        <!-- Registrazione Button -->
                        <div class="row block-9 align-items-center justify-content-center" style="padding-top: 3rem">
                            <c:if test="${not loggedIn}">
                                <a href="${ctx}/registrati" class="btn btn-primary-registrati py-3 px-5">Registrati</a>
                            </c:if>
                        </div>

                    </div>
                </div>


            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->
<%@include file="segment/loader.jsp" %>
<%@include file="segment/footer_js.jsp" %>
</body>
</html>--%>
