<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <title><spring:message code="register.title"/></title>
    <%@include file='segment/head_css.jsp' %>
</head>
<body>
<div id="colorlib-page">
    <%@include file='segment/aside.jsp' %>
    <div id="colorlib-main">
        <!-- Titolo -->
        <div class="ftco-section ftco-titolo sticky">
            <div class="container-header">
                <div class="row no-gutters slider-text justify-content-center align-items-center">
                    <div class="col-md-12 ftco-animate">
                        <h1 class="bread"><spring:message code="register.title"/></h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Inizio dei contenuti -->
        <section class="ftco-section-no-padding contact-section" style="padding: 3rem 0;">
            <div class="container">
                <div class="row block-9">
                    <!-- Redirect registrazione effettuata -->
                    <c:if test="${stato==true}">
                        <div class="col-md-12 d-flex">
                            <h2 class="w-100 p-0 m-0 fs-20"><spring:message code="register.contact.ok"/></h2>
                        </div>
                        <script>
                            setTimeout(function () {
                                window.location.href = '${ctx}/login';
                            }, 5000);
                        </script>
                    </c:if>
                    <!-- inizio contenuto -->
                    <c:if test="${stato==false||stato==null}">
                        <form:form action="${ctx}/registrati" method="post" class="bg-light p-5-custom contact-form"
                                   modelAttribute="RegistrazioneForm" enctype="multipart/form-data">
                            <div class="container">
                            <!-- Registrazione Utente -->
                            <div class="row block-9">
                                <div class="col-md-12 d-flex align-items-start justify-content-center">
                                    <h2><spring:message code="register.title"/></h2>
                                </div>
                                <div class="col-md-12">
                                    <hr class="colorgraph" style="padding: 0.5rem">
                                </div>
                            </div>
                            <!-- Nome e Cognome -->
                            <div class="row block-9">
                                <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                                    <div class="form-group text-right "><spring:message
                                            code="form.registration.firstname"/></div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="form-group">
                                        <form:input type="text" name="nome" path="nome" required="required"
                                                    class="form-control"/>
                                        <form:errors path="nome" cssClass="error" element="div"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-2  d-flex align-items-center justify-content-start">
                                    <div class="form-group text-right "><spring:message
                                            code="form.registration.lastname"/></div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="form-group "><form:input type="text" path="cognome" name="cognome"
                                                                         class="form-control" required="required"/>
                                        <form:errors path="cognome" cssClass="error" element="div"/>
                                    </div>
                                </div>
                            </div>
                            <!-- Data di nascita -->
                            <div class="row block-9">
                                <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                                    <div class="form-group text-right "><spring:message
                                            code="form.profile.birthdate"/></div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="form-group">
                                        <form:input type="date" path="dataDiNascita" name="dataDiNascita"
                                                    class="form-control" max="${LocalDate.now()}" required="required"/>
                                        <form:errors path="cognome" cssClass="error" element="div"/>
                                    </div>
                                </div>
                            </div>
                            <!-- Sesso -->
                            <div class="row block-9">
                                <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                                    <div class="form-group text-right "><spring:message
                                            code="form.profile.gender"/></div>
                                </div>
                                <div class="col-sm-12 col-md-5 line-height">
                                    <div class="form-group radio-button">
                                        <label class="inline-label">
                                            <form:radiobutton path="sesso" value="m" required="required"/>
                                                <spring:message code="form.profile.male"/>&emsp;
                                        </label>
                                        <label class="inline-label"><form:radiobutton path="sesso" value="f"
                                                                                      required="required"/>
                                                <spring:message code="form.profile.female"/>&emsp;&emsp;</label>
                                        <label class="inline-label"><form:radiobutton path="sesso" value="a"
                                                                                      required="required"/>
                                                <spring:message code="form.profile.other"/>&emsp;</label>
                                    </div>
                                </div>
                            </div>
                            <!-- Interesse -->
                            <div class="row block-9">
                                <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-center justify-content-start">
                                    <div class="form-group text-right "><spring:message
                                            code="form.profile.interests"/></div>
                                </div>
                                <div class="col-sm-12 col-md-5 line-height">
                                    <div class="form-group radio-button">
                                        <label class="inline-label"><form:radiobutton path="interesse" value="m"
                                                                                      required="required"/>
                                                <spring:message code="form.profile.men"/>&emsp;&emsp;</label>
                                        <label class="inline-label"><form:radiobutton path="interesse" value="f"
                                                                                      required="required"/>
                                                <spring:message code="form.profile.women"/>&emsp;&emsp;</label>
                                        <label class="inline-label"><form:radiobutton path="interesse" value="a"
                                                                                      required="required"/>
                                                <spring:message code="form.profile.both"/>&emsp;</label>
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
                                        <form:input type="text" path="mail" name="mail" class="form-control"
                                                    required="required"
                                                    pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})"/>
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
                                                    required="required"/>
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
                                                    class="form-control" required="required"/>
                                        <form:errors path="confirmPassword" cssClass="error" element="div"/>
                                    </div>
                                </div>
                            </div>
                            <!-- Descrizione -->
                            <div class="row block-9">
                                <div class="col-sm-12 col-md-2 offset-md-1  d-flex align-items-baseline justify-content-start">
                                    <div class="form-group text-right "><spring:message
                                            code="form.profile.description"/></div>
                                </div>
                                <div class="col-sm-12 col-md-8">
                                    <div class="form-group">
                                        <form:textarea name="descrizione" path="descrizione" id="" cols="8" rows="7"
                                                       class="form-control"/>
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
                                        <spring:message code="choose.file.image" var="varimg"/>
                                        <form:label path="immagine">
                                            <form:input type="file" name="immagine" path="immagine" class="inputfile"/>
                                            <label for="immagine"><span><spring:message
                                                    code="choose.file.image"/>&hellip;</span></label>
                                            <form:errors path="immagine" cssClass="error" element="div"/>
                                        </form:label>
                                    </div>
                                </div>
                            </div>
                            <!-- Fine contenuti -->
                            <div class="col-md-12">
                                <hr class="colorgraph" style="padding: 1rem">
                            </div>
                            <!-- RegistrationButton -->
                            <div class="row block-9">
                                <div class="col-sm-12 col-md-4 offset-md-3 d-flex align-items-center justify-content-end">
                                    <div class="col-xs-12">
                                        <form:button type="submit"
                                                     class="btn btn-primary py-3 px-5">Registrati</form:button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <%-- <%@include file="segment/footer.jsp" %> --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->
<%@include file='segment/loader.jsp' %>
<%@include file='segment/footer_js.jsp' %>
</body>
</html>