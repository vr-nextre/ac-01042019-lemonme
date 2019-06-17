<%@ page import="it.nextre.academy.lemonme.entity.Utente" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="scopri.title"/></title>

    <%@include file="segment/head_css.jsp" %>
</head>
<body>

<div id="colorlib-page">
    <%@include file="segment/aside.jsp" %>
    <div id="colorlib-main">
        <div class="ftco-section ftco-titolo sticky">
            <div class="container-header">
                <div class="row no-gutters slider-text justify-content-center align-items-center">
                    <div class="col-md-12 ftco-animate">
                        <h1 class="bread"><spring:message code="scopri.title"/></h1>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section: Social news card -->
        <section class="ftco-section-no-padding" style="padding: 2rem">
            <div class="container">
                <!-- Grid row -->
                <div class="row">
                    <!-- Grid column -->
                    <sec:authentication property="principal.id" var="prc"/>
                    <c:forEach items="${amico}" var="bro">
                        <c:if test="${prc!=bro.id}">
                            <div class="col-md-6 col-lg-4">
                                <!-- Card -->
                                <div class="card news-card">
                                    <!-- Heading-->
                                    <div class="card-body">
                                        <div class="content" style="‘width: 120px; height: 130px" ;>
                                            <div class="right-side-meta"><br></div>
                                                <%--<img src="${ctx}/res/profileImage/${bro.id}/imgprofile.jpg" width="120px"
                                                     height="120px" class="rounded-circle float-left" alt="">--%>
                                            <h3>&emsp; ${bro.nome}</h3>
                                            <h3>&emsp; ${bro.cognome}</h3>
                                        </div>
                                    </div>
                                    <div class="ftco-animate">
                                        <a href="${ctx}/res/profileImage/${bro.id}/imgprofile.jpg" class="photography-entry img image-popup justify-content-start align-items-end "
                                           style="background-image: url(${ctx}/res/profileImage/${bro.id}/imgprofile.jpg);">
                                            <div class="overlay"></div>
                                            <div class="text ml-4 mb-4">
                                                <h3><br>Data di nascita: ${bro.dataDiNascita}<br>
                                                    Descrizione:
                                                    <c:if test="${bro.descrizione.length()>80}">
                                                        ${bro.descrizione.substring(0,79)}
                                                    </c:if>
                                                    <c:if test="${bro.descrizione.length()<=80}">
                                                        ${bro.descrizione}
                                                    </c:if>
                                                </h3>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <!-- Social meta-->
                                            <%--<div class="social-meta">
                                                <p><b>Descrizione:</b> ${user.descrizione} </p>
                                            </div>--%>
                                        <hr>
                                        <!-- Comment input -->
                                        <i class="far fa-heart prefix"></i>
                                        <form action="${ctx}/scopri" method="post" modelAttribute="ScopriForm">
                                            <input type="hidden" name="value" value="${bro.id}"/>
                                            <button type="submit" class="btn btn-outline-success">Invia richiesta
                                            </button>
                                        </form>
                                    </div>
                                    <!-- Card content -->
                                </div>
                                <!-- Card -->
                            </div>
                        </c:if>
                    </c:forEach>
                    <!-- Grid column -->

                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Social news card -->


        <%--
       <%@include file="segment/footer.jsp" %>
       --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<%@include file="segment/loader.jsp" %>

<%@include file="segment/footer_js.jsp" %>

</body>
</html>