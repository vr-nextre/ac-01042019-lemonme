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
    <title>Login</title>

    <%@include file="segment/head_css.jsp" %>

</head>
<body>

<div id="colorlib-page">
    <%@include file="segment/aside.jsp" %>
    <div id="colorlib-main">
        <!-- inizio contenuto -->
        <div class="ftco-section ftco-titolo sticky">
            <div class="container-header">
                <div class="row no-gutters slider-text justify-content-center align-items-center">
                    <div class="col-md-12 ftco-animate">
                        <h1 class="bread"><spring:message code="login.title"/></h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-4-custom">
                    <%-- versione ctx --%>
                    <%-- <form class="form-signin" method="post" action="${ctx}/login"> --%>
                    <%-- versione spring:url autocontext --%>
                    <form class="form-signin" method="post" action="<spring:url value="/login" />">


                        <c:if test="${param.error!=null}">
                            <div class="alert alert-danger"><spring:message code="login.error"/></div>
                        </c:if>
                        <c:if test="${param.success!=null}">
                            <div class="alert alert-info">Utente registrato con successo</div>
                        </c:if>

                        <p>
                            <label for="username" class="sr-only">Email</label>
                            <input type="text" id="username" name="username" class="form-control" placeholder="Email"
                                   required autofocus>
                        </p>
                        <p>
                            <label for="password" class="sr-only">Password</label>
                            <input type="password" id="password" name="password" class="form-control"
                                   placeholder="Password"
                                   required>
                        </p>
                        <div class="text-center mt-4">
                            <button class="btn btn-primary py-3 px-5" type="submit"><spring:message code="login.title"/></button>
                        </div>
                        <div class="text-center mt-4"><a href="${ctx}/registrati"><spring:message code="login.signup"/></a></div>
                    </form>
                </div>
            </div>

            <%--
            <%@include file="segment/footer.jsp" %>
            --%>
        </div><!-- END COLORLIB-MAIN -->
    </div><!-- END COLORLIB-PAGE -->

    <%@include file="segment/loader.jsp" %>


    <%@include file="segment/footer_js.jsp" %>

</body>

</html>