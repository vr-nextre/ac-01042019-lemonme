<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"/>


<!DOCTYPE html>
<html lang="en">
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