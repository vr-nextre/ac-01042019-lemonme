<%@ page import="it.nextre.academy.lemonme.entity.Utente" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="friends.title"/></title>
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
                        <h1 class="bread"><spring:message code="friends.title"/></h1>
                        <p class="breadcrumbs"><span><a href="${ctx}/richiesteAmicizia"><spring:message code="friends.request.title"/></a></span></p>
                    </div>
                </div>
            </div>
        </div>
        <%--  <section class="ftco-section-cards">
              <div class="container-card">
                  <c:forEach items="${lista_amici}" var="amici">
                      <c:if test="${amici.amici.contains(utente)}">
                          <div class="card ftco-animate fadeInUp ftco-animated" style="width: 22rem; float: left">
                              <div class="card-body">
                                  <img src="${ctx}/res/profileImage/${amici.id}/imgprofile.jpg" width="120px" height="120px" class="rounded-circle float-left">
                                  <h5 class="card-title">
                                      <c:if test="${amici.nome.length()>8}">
                                          ${amici.nome.substring(0,8)}
                                      </c:if>
                                      <c:if test="${amici.nome.length()<=8}">
                                          ${amici.nome}
                                      </c:if>
                                      <br>
                                      <c:if test="${amici.cognome.length()>8}">
                                          ${amici.cognome.substring(0,8)}
                                      </c:if>
                                      <c:if test="${amici.cognome.length()<=8}">
                                          ${amici.cognome}
                                      </c:if>
                                  </h5>
                                  <p class="card-text"><br>${amici.descrizione}</p>
                                  <div align="center">
                                      <form action="${ctx}/amici" method="post" modelAttribute="BottoneRimuovi">
                                          <input type="hidden" name="value" path="value" value="${amici.id}">
                                          <button type="submit" class="btn btn-outline-danger">Rimuovi</button>
                                      </form>
                                  </div>
                              </div>
                          </div>
                      </c:if>
                  </c:forEach>
              </div>
          </section>--%>
        <section class="ftco-section" style="margin-top: 3.5rem;">
            <div class="container">
                <%--<div class="col-12 d-inline-flex">--%>
                    <div class="col-12">
                        <c:forEach items="${lista_amici}" var="amici">
                            <c:if test="${amici.amici.contains(utente)}">
                                <div class="row">
                                    <%--<div class="col-md-12">--%>
                                        <div class="col-md-12 blog-entry ftco-animate d-md-flex">
                                            <a class="col-md-4 img img-2" style="background-image: url(${ctx}/res/profileImage/${amici.id}/imgprofile.jpg);"></a>
                                            <div class="col-md-8 text text-2 p-4" style="height:300px;">
                                                <h3 class="mb-2">
                                                        ${amici.nome}
                                                    <br>
                                                        ${amici.cognome}
                                                </h3>
                                                <div class="meta-wrap">
                                                    <p class="meta">
                                                        <span>${-amici.dataDiNascita.toLocalDate().compareTo(LocalDate.now())} <spring:message code="friends.year"/></span>
                                                        <span>${amici.mail}</span>
                                                    </p>
                                                </div>
                                                <p class="mb-4 p-text">${amici.descrizione}</p>
                                            </div>
                                        </div>
                                    <%--</div>--%>
                                </div>
                                <!-- END-->
                            </c:if>
                        </c:forEach>
                    </div>
               <%-- </div>--%>
            </div>
        </section>
        <%--
        <%@include file="segment/footer.jsp" %>
        --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->
<%@include file="segment/loader.jsp" %>
<%@include file="segment/footer_js.jsp" %>
</body>
</html>