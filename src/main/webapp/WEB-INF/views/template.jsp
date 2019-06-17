<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Template</title>

    <%@include file="segment/head_css.jsp"%>

</head>
<body>

<div id="colorlib-page">


    <%@include file="segment/aside.jsp"%>

    <div id="colorlib-main">
        <%--
        <%@include file="segment/footer.jsp" %>
        --%>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<%@include file="segment/loader.jsp" %>

<%@include file="segment/footer_js.jsp" %>

</body>
</html>