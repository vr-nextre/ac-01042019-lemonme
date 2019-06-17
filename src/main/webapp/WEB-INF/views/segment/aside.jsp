<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" scope="request"/>
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">

    <nav id="colorlib-main-menu" role="navigation">
        <ul>
            <sec:authorize var="loggedIn" access="isAuthenticated()"/>
            <c:choose>
                <c:when test="${loggedIn}">
                    <h1 id="colorlib-logo"><a href="${ctx}/"><span class="img" style="background-image: url(${ctx}/res/profileImage/<sec:authentication property="principal.id" />/imgprofile.jpg);"></span>Lemon Me</a></h1>
                    <li class="${pagina.endsWith('/index') ? 'colorlib-active' : ''} ${pagina.endsWith('/') ? 'colorlib-active' : ''} "><a href="${ctx}/"><spring:message code="home.title"/></a></li>
                    <li class="${pagina.endsWith('/lista_amici') ? 'colorlib-active' : ''}"><a href="${ctx}/amici"><spring:message code="friends.title"/></a></li>
                    <li class="${pagina.endsWith('/profilo') ? 'colorlib-active' : ''}"><a href="${ctx}/profilo"><sec:authentication property="principal.nome" /></a></li>
                    <li class="${pagina.endsWith('/scopri') ? 'colorlib-active' : ''}"><a href="${ctx}/scopri"><spring:message code="scopri.title"/></a></li>
                    <li class="${pagina.endsWith('/supporto') ? 'colorlib-active' : ''}"><a href="${ctx}/supporto"><spring:message code="support.title"/></a></li>
                    <li class="${pagina.endsWith('/logout') ? 'colorlib-active' : ''}"><a href="<c:url value="/logout"/>">Logout</a></li>
                </c:when>
                <c:otherwise>
                    <h1 id="colorlib-logo"><a href="${ctx}/"><span class="img flip" style="background-image: url(${ctx}/res/images/default/lemon.jpg);"></span>Lemon Me</a></h1>
                    <li class="${pagina.endsWith('/index') ? 'colorlib-active' : ''} ${pagina.endsWith('/') ? 'colorlib-active' : ''} "><a href="${ctx}/"><spring:message code="home.title"/></a></li>
                    <li class="${pagina.endsWith('/supporto') ? 'colorlib-active' : ''}"><a href="${ctx}/supporto"><spring:message code="support.title"/></a></li>
                    <li class="${pagina.endsWith('/registrati') ? 'colorlib-active' : ''}"><a href="${ctx}/registrati"><spring:message code="register.title"/></a></li>
                </c:otherwise>
            </c:choose>
            <%-- Login --%>
            <c:if test="${not loggedIn}">
                <div class="d-flex justify-content-center" style="padding-top: 5rem;">
                    <form class="form-signin" method="post" action="<spring:url value="/login" />">
                        <c:if test="${param.error!=null}">
                            <div class="alert alert-danger"><spring:message code="login.error"/></div>
                        </c:if>
                        <c:if test="${param.success!=null}">
                            <div class="alert alert-info">Utente loggato con successo</div>
                        </c:if>
                        <div class="row-login">
                            <label for="username" class="sr-only">Email</label>
                            <input type="text" id="username" name="username" class="form-control-login" placeholder="Email" required="required" >
                        </div>
                        <div class="row-login">
                            <label for="password" class="sr-only">Password</label>
                            <input type="password" id="password" name="password" class="form-control-login" placeholder="Password" required="required">
                        </div>
                        <div class="text-center mt-4">
                            <button class="btn btn-primary" type="submit" style="margin-top: -1rem"><spring:message code="login.title"/></button>
                        </div>
                    </form>
                </div>
            </c:if>
        </ul>
    </nav>
    <div class="flags" style="padding: 2rem">
        <span data-lang="it" class="flag-icon flag-icon-it"></span>
        <span data-lang="en" class="flag-icon flag-icon-gb"></span>
    </div>

</aside>
<!-- END COLORLIB-ASIDE -->