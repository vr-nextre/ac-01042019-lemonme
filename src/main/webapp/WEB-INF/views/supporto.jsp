<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="it">
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


        <!-- CONTENT HERE -->
        <section class="ftco-section ftco-titolo">
            <div class="container">
                <div class="row no-gutters slider-text justify-content-center align-items-center">
                    <div class="col-md-12 ftco-animate">
                        <h1 class="bread">Supporto</h1>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section contact-section">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-12 mb-4">
                        <h2 class="h3 font-weight-bold">FAQ</h2>
                    </div>
                    <div class="w-100"></div>
                    <div class="col-md-6 d-flex mb-4">
                        <div class="info bg-light p-4">
                            <h3>Quanto costa il servizio?</h3>
                            <p>Caro utente il servizio è gratuito previo utilizzo dei suoi dati personali venduti a terzi</p>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex mb-4">
                        <div class="info bg-light p-4">
                            <h3>Chi userà i miei dati personali?</h3>
                            <p>Nessuno al di fuori di tutti.</p>
                        </div>
                    </div>
                </div><!-- end row -->





                <div class="row block-9">
                    <div class="col-md-12 mb-4">
                        <h2 class="h3 font-weight-bold">Scrivici</h2>
                    </div>





                    <c:if test="${stato==true}">
                        <div class="col-md-6 d-flex">
                            <div class="info bg-light p-4">
                                <p class=" w-100 p-0 m-0 fs-14">
                                    <spring:message code="support.contact.ok" />
                                </p>
                            </div>
                        </div>
                    </c:if>





                    <c:if test="${stato==null || stato==false}">
                        <div class="col-md-6 d-flex">
                            <form:form action="${ctx}/supporto" method="post" class="bg-light p-5 contact-form" modelAttribute="SupportoForm">
                                <div class="form-group">
                                    <form:input type="text" path="nome" name="nome" class="form-control" placeholder="Nome e Cognome" required="required" /><form:errors path="nome" cssClass="text-danger" element="div"/>
                                </div>
                                <div class="form-group">
                                    <form:input type="email" path="email" name="email" class="form-control" placeholder="Email"   /><form:errors path="email" cssClass="text-danger" element="div"/>
                                </div>
                                <div class="form-group">
                                    <form:input type="text" path="oggetto" name="oggetto" class="form-control" placeholder="Oggetto" required="required" /><form:errors path="oggetto" cssClass="text-danger" element="div"/>
                                </div>
                                <div class="form-group">
                                    <form:textarea path="messaggio" name="messaggio" cols="30" rows="7" class="form-control" placeholder="Messaggio" required="required"></form:textarea>
                                    <form:errors path="messaggio" cssClass="text-danger" element="div"/>
                                </div>
                                <div class="form-group">
                                    <form:button type="submit" class="btn btn-primary py-3 px-5" >Scrivi</form:button>
                                </div>
                            </form:form>
                        </div>
                    </c:if>






                    <div class="col-md-6 ">
                        <div class="bg-light"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2642.254054827811!2d9.172569596563957!3d45.442189528778975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa7aa7aa40ff726b3!2sNextre+Digital+-+Web+Agency+%7C+Consulenza+SEO%2C+Social+Media+%26+SEM%2C+Sviluppo+siti+Web!5e0!3m2!1sit!2sit!4v1559223064008!5m2!1sit!2sit" width="100%" height="600" frameborder="0" style="border:0; width:100%;" allowfullscreen></iframe></div>
                    </div>
                </div> <!-- end row -->



            </div><!-- container end -->
        </section>


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