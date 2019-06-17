<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="form.profile.title"/> ${utente.nome}!</title>
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
                        <h1 class="bread"><spring:message code="form.profile.title"/> ${utente.nome}!</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Inizio dei contenuti -->
        <section class="ftco-section-no-padding contact-section" style="padding: 3rem 0;">
            <div class="bg-light p-5 contact-form-custom">
                <div class="container">
                    <!-- Update your profile -->
                    <div class="row block-9">
                        <div class="col-md-12 d-flex align-items-start justify-content-center">
                            <h2><spring:message code="profile.title"/></h2>
                        </div>
                        <div class="col-md-12">
                            <hr class="colorgraph" style="padding: 0.5rem">
                        </div>
                    </div>
                    <!-- Nome e Cognome -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1 d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message
                                    code="form.profile.firstname"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <h5 class="mb-3">
                                <sec:authentication property="principal.nome"/>
                            </h5>
                        </div>
                        <div class="col-sm-12 col-md-2  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.lastname"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <h5 class="mb-3">
                                ${utente.cognome}
                            </h5>
                        </div>
                    </div>
                    <!-- Data di nascita  -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message
                                    code="form.profile.birthdate"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group">
                                <h5 class="mb-3">
                                    ${utente.dataDiNascita}
                                </h5>
                            </div>
                        </div>
                    </div>
                    <!-- Sesso -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.gender"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group radio-button">
                                <c:if test="${fn:contains(utente.sesso, 'm')}">
                                    <h5 class="mb-3">
                                            <spring:message code="form.profile.male"/>&emsp;
                                    </h5>
                                </c:if>
                                <c:if test="${fn:contains(utente.sesso, 'f')}">
                                    <h5 class="mb-3">
                                            <spring:message code="form.profile.female"/>&emsp;
                                    </h5>
                                </c:if>
                                <c:if test="${fn:contains(utente.sesso, 'a')}">
                                    <h5 class="mb-3">
                                            <spring:message code="form.profile.other"/>&emsp;
                                    </h5>
                                </c:if>
                            </div>
                        </div>

                        <!-- Interesse -->
                        <div class="col-sm-12 col-md-2 d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message
                                    code="form.profile.interests"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group radio-button">
                                <c:if test="${fn:contains(utente.interesse, 'm')}">
                                    <h5 class="mb-3">
                                            <spring:message code="form.profile.men"/>&emsp;
                                    </h5>
                                </c:if>
                                <c:if test="${fn:contains(utente.interesse, 'f')}">
                                    <h5 class="mb-3">
                                            <spring:message code="form.profile.women"/>&emsp;
                                    </h5>
                                </c:if>
                                <c:if test="${fn:contains(utente.interesse, 'a')}">
                                    <h5 class="mb-3">
                                            <spring:message code="form.profile.both"/>&emsp;
                                    </h5>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Email -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1 d-flex align-items-center justify-content-start">
                            <div class="form-group text-right ">Email</div>
                        </div>
                        <div class="col-sm-12 col-md-5">
                            <div class="form-group">
                                <h5 class="mb-3">
                                    <sec:authentication property="principal.mail"/>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <!-- Descrizione -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1 d-flex align-items-baseline mt-2 justify-content-start">
                            <div class="form-group text-right"><spring:message
                                    code="form.profile.description"/></div>
                        </div>
                        <div class="col-sm-12 col-md-8">
                            <div class="form-group">
                                <h6 class="mt-2 p-text-custom">${utente.descrizione}</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Fine contenuti -->
                    <div class="col-md-12">
                        <hr class="colorgraph" style="padding: 1rem">
                    </div>
                    <!-- Modifica Button -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-4 offset-md-4 d-flex justify-content-center">
                            <a href="${ctx}/updateProfilo">
                                <button type="submit" class="btn btn-primary py-3 px-5"><spring:message code="profile.modify"/>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%-- <%@include file="segment/footer.jsp" %> --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->
<%@include file="segment/loader.jsp" %>
<%@include file="segment/footer_js.jsp" %>
</body>
</html>