<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="support.title"/></title>
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
                        <h1 class="bread"><spring:message code="support.title"/></h1>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section contact-section">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-6 mb-4">
                        <h2 class="h3 font-weight-bold">FAQ</h2>
                    </div>
                    <div class="w-100"></div>
                    <div class="col-md-6 d-flex mb-4">
                        <div class="info bg-light p-4">
                            <h3>Quanto costa il servizio?</h3>
                            <p>Troppo zi'</p>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex mb-4">
                        <div class="info bg-light p-4">
                            <h3>Chi userà i miei dati personali?</h3>
                            <p>Nessuno al di fuori tutti.</p>
                        </div>
                    </div>
                    <%-- end row --%>

                </div>
                <div class="row block-9">
                <div class="col-md-12 mb-4">
                    <h2 class="h3 font-weight-bold">Scrivici</h2>
                </div>
                <c:if test="${stato==true}">
                    <div class="col-md-6 d-flex">
                        <h2 class="w-100 p-0 m-0 fs-20">
                            <spring:message code="support.contact.ok"/></h2>
                    </div>
                </c:if>

                <c:if test="${stato==false||stato==null}">
                    <div class="col-md-6 d-flex">
                        <form:form action="${ctx}/supporto" method="post" class="bg-light p-5 contact-form"
                                   modelAttribute="SupportoForm">
                            <div class="form-group">
                                <form:input type="text" path="nome" name="nome" required="required"
                                            class="form-control"
                                            placeholder="Nome e Cognome"/>
                                <form:errors path="nome" cssClass="text-danger" element="div"/>
                            </div>
                            <div class="form-group">
                                <form:input type="email" path="email" name="email"
                                            class="form-control" placeholder="Email"/>
                                <form:errors path="email" cssClass="text-danger" element="div"/>
                            </div>
                            <div class="form-group">
                                <form:input type="text" path="oggetto" name="oggetto" required="required"
                                            class="form-control" placeholder="Oggetto"/>
                                <form:errors path="oggetto" cssClass="text-danger" element="div"/>
                            </div>
                            <div class="form-group">
                                <form:textarea path="messaggio" name="messaggio" required="required" cols="30"
                                               rows="7"
                                               class="form-control"
                                               placeholder="Messaggio"/>
                                <form:errors path="messaggio" cssClass="text-danger" element="div"/>
                            </div>
                            <div class="form-group">
                                <input type="submit" path="Invia" value="Invia"
                                       class="btn btn-primary py-3 px-5"/>
                            </div>
                        </form:form>
                    </div>
                </c:if>
                <div class="resp-container col-md-6 d-flex">
                        <iframe class="resp-iframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2812.085769893157!2d9.476471987061519!3d45.185359992903024!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4780d5dff5d6eec7%3A0x25cf6b7f9e68035d!2sTennis+San+Colombano+Al+Lambro!5e0!3m2!1sit!2sit!4v1559223099313!5m2!1sit!2sit"
                                width="540" height="600" style="border:0"
                                allowfullscreen>

                        </iframe>
                </div>
            </div>
            </div>
        </section>

        <%--
       <%@include file="segment/footer.jsp" %>
       --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<%-- Loader --%>
<%@include file="segment/loader.jsp" %>
<%-- Fotter --%>
<%@include file="segment/footer_js.jsp" %>
</body>
</html>