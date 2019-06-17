<%@ page import="it.nextre.academy.lemonme.entity.Utente" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="friends.request.title"/></title>
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
                        <h1 class="bread"><spring:message code="friends.request.title"/></h1>
                        <p class="breadcrumbs"><span><a href="${ctx}/amici"><spring:message
                                code="friends.title"/></a></span></p>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section-cards" style="margin-top: 3.5rem; margin-left: 3.5rem;">
            <div class="container-card">
                <c:set var="count" value="0" scope="page" />
                <c:forEach items="${lista_amici_di}" var="amici">
                    <c:if test="${amici.amici.contains(utente) && !utente.amici.contains(amici)}">
                        <div class="card ftco-animate fadeInUp ftco-animated" style="width: 22rem; float: left;">
                            <div class="card-body">
                                <img src="${ctx}/res/profileImage/${amici.id}/imgprofile.jpg" width="120px"
                                     height="120px" class="rounded-circle float-left">
                                <h5 class="card-title">${amici.nome} <br> ${amici.cognome}</h5>
                                <p class="card-text"><br>${amici.descrizione}</p>
                                <div align="center">
                                    <form action="${ctx}/richiesteAmicizia" method="post"
                                          modelAttribute="BottoneRichiesta">
                                        <table cellpadding="5" align="center">
                                            <tr>
                                                <td>

                                                    <button type="button" onclick="set(this,'accetta')"
                                                            class="btn btn-outline-success">Accetta
                                                    </button>

                                                </td>
                                                <td>

                                                    <button type="button" onclick="set(this,'rifiuta')"
                                                            class="btn btn-outline-danger">Rifiuta
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="hidden" name="amico" path="amico" value="${amici.id}">
                                        <input type="hidden" name="stato" path="stato" value="">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <c:set var="count" value="${count + 1}" scope="page"/>
                    </c:if>
                </c:forEach>
                <c:if test="${count==0}">
                    <div class="container" style="padding: 4rem 3rem;">

                        <h3><spring:message code="friends.control.request"/></h3>
                    </div>
                </c:if>
            </div>
        </section>

        <%--
        <%@include file="segment/footer.jsp" %>
        --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<%@include file="segment/loader.jsp" %>

<%@include file="segment/footer_js.jsp" %>


<script>

    function set(item, valore) {
        //alert(valore)
        console.log(item);
        var stato = $(item).parents('form').children('input[name=stato]');
        var form = $(item).parents('form');
        console.log(stato);
        stato.val(valore);
        console.log(stato.val());
        form.submit();
    }
</script>

</body>
</html>