<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="form.profile.update"/></title>
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
                        <h1 class="bread"><spring:message code="form.profile.title"/> ${nome}!</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Inizio dei contenuti -->
        <section class="ftco-section-no-padding contact-section" style="padding: 3rem 0;">
            <form:form action="${ctx}/profilo" method="put" class="bg-light p-5 contact-form-custom"
                       modelAttribute="ProfiloForm" enctype="multipart/form-data">
                <div class="container">
                    <!-- Update your profile -->
                    <div class="row block-9">
                        <div class="col-md-12 d-flex align-items-start justify-content-center">
                            <h2><spring:message code="form.profile.update"/></h2>
                        </div>
                        <div class="col-md-12">
                            <hr class="colorgraph" style="padding: 0.5rem">
                        </div>
                    </div>
                    <!-- Nome e Cognome -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.firstname"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group">
                                <form:input type="text" path="nome" name="nome" class="form-control" value="${nome}"
                                            required="required"/>
                                <form:errors path="nome" cssClass="error" element="div"/>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-2  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.lastname"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group "><form:input type="text" path="cognome" name="cognome"
                                                                 class="form-control" value="${cognome}"
                                                                 required="required"/>
                                <form:errors path="cognome" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <!-- Data di nascita  -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.birthdate"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group">
                                <form:input type="date" path="dataDiNascita" name="dataDiNascita" class="form-control"
                                            value="${dataDiNascita}" max="${LocalDate.now()}" required="required"/>
                                <form:errors path="cognome" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <!-- Sesso -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.gender"/></div>
                        </div>
                        <div class="col-sm-12 col-md-5 line-height">
                            <div class="form-group radio-button">
                                <label class="inline-label">
                                    <c:choose>
                                        <c:when test="${fn:contains(sesso, 'm')}">
                                            <form:radiobutton path="sesso" value="m" required="required"
                                                              checked="checked"/>
                                            <spring:message code="form.profile.male"/>&emsp;
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="sesso" value="m" required="required"/>
                                            <spring:message code="form.profile.male"/>&emsp;
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                                <label class="inline-label">
                                    <c:choose>
                                        <c:when test="${fn:contains(sesso, 'f')}">
                                            <form:radiobutton path="sesso" value="f" required="required"
                                                              checked="checked"/>
                                            <spring:message code="form.profile.female"/>&emsp;
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="sesso" value="f" required="required"/>
                                            <spring:message code="form.profile.female"/>&emsp;
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                                <label class="inline-label">
                                    <c:choose>
                                        <c:when test="${fn:contains(sesso, 'a')}">
                                            <form:radiobutton path="sesso" value="a" required="required"
                                                              checked="checked"/>
                                            <spring:message code="form.profile.other"/>&emsp;
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="sesso" value="a" required="required"/>
                                            <spring:message code="form.profile.other"/>&emsp;
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Interesse -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.interests"/></div>
                        </div>
                        <div class="col-sm-12 col-md-5 line-height">
                            <div class="form-group radio-button">
                                <label class="inline-label">
                                    <c:choose>
                                        <c:when test="${fn:contains(interesse, 'm')}">
                                            <form:radiobutton path="interesse" value="m" required="required"
                                                              checked="checked"/>
                                            <spring:message code="form.profile.men"/>&emsp;
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="interesse" value="m" required="required"/>
                                            <spring:message code="form.profile.men"/>&emsp;
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                                <label class="inline-label">
                                    <c:choose>
                                        <c:when test="${fn:contains(interesse, 'f')}">
                                            <form:radiobutton path="interesse" value="f" required="required"
                                                              checked="checked"/>
                                            <spring:message code="form.profile.women"/>&emsp;
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="interesse" value="f" required="required"/>
                                            <spring:message code="form.profile.women"/>&emsp;
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                                <label class="inline-label">
                                    <c:choose>
                                        <c:when test="${fn:contains(interesse, 'a')}">
                                            <form:radiobutton path="interesse" value="a" required="required"
                                                              checked="checked"/>
                                            <spring:message code="form.profile.both"/>&emsp;
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="interesse" value="a" required="required"/>
                                            <spring:message code="form.profile.both"/>&emsp;
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                            </div>
                        </div>
                    </div>


                    <!-- Email -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right ">Email</div>
                        </div>
                        <div class="col-sm-12 col-md-5">
                            <div class="form-group">
                                <form:input type="text" path="mail" name="mail" class="form-control" value="${mail}"
                                            required="required"/>
                                <form:errors path="mail" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <!-- Password e Confirm Password -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right ">Password</div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group">
                                <form:input type="password" path="password" name="Password" class="form-control"
                                            value="${null}"/>
                                <form:errors path="password" cssClass="error" element="div"/>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-2  d-flex align-items-center justify-content-start">
                            <div class="form-group text-left"><spring:message
                                    code="form.registration.confirmpwd"/></div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="form-group">
                                <form:input type="password" path="confirmPassword" name="ConfirmPassword"
                                            class="form-control" value="${null}"/>
                                <form:errors path="confirmPassword" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <!-- Descrizione -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-baseline justify-content-start">
                            <div class="form-group text-right "><spring:message code="form.profile.description"/></div>
                        </div>
                        <div class="col-sm-12 col-md-8">
                            <div class="form-group">
                                <form:textarea name="descrizione" path="descrizione" cols="8" rows="7"
                                               class="form-control"></form:textarea>
                                <form:errors path="descrizione" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <!-- Immagine Profilo -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                            <div class="form-group text-right "><spring:message code="choose.file.image"
                                                                                var="varimg"/></div>
                        </div>
                        <div class="col-sm-12 col-md-8">
                            <div class="form-group">
                                <form:label path="immagine">
                                    <form:input type="file" name="immagine" path="immagine" class="inputfile"/>
                                    <label for="immagine"><span><spring:message
                                            code="choose.file.image"/>&hellip;</span></label>
                                    <div><img src="${ctx}/res/profileImage/${idUtente}/imgprofile.jpg"
                                              class="rounded-circle" height="120px" width="120px"></div>
                                    <form:errors path="immagine" cssClass="error" element="div"/>
                                </form:label>
                            </div>
                        </div>
                    </div>
                    <!-- Fine contenuti -->
                    <div class="col-md-12">
                        <hr class="colorgraph" style="padding: 1rem">
                    </div>
                    <!-- Save and Cancel Button -->
                    <div class="row block-9">
                        <div class="col-sm-12 col-md-4 offset-md-1 d-flex align-items-center justify-content-end">
                            <div class="col-xs-12">
                                <form:button type="submit" class="btn-success py-3 px-5">Salva</form:button></div>
                        </div>
                        <div class="col-sm-12 col-md-4 d-flex align-items-center justify-content-end">
                            <div class="col-xs-12">
                                <a href="${ctx}/profilo"><form:button type="submit"
                                                                      class="btn-danger py-3 px-5">Annulla</form:button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </section>
        <%-- <%@include file="segment/footer.jsp" %> --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->
<%@include file="segment/loader.jsp" %>
<%@include file="segment/footer_js.jsp" %>
</body>
</html>
