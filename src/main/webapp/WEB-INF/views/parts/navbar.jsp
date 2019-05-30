<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" scope="request" />


<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
    <h1 id="colorlib-logo"><a href="${ctx}/"><span class="img" style="background-image: url(${ctx}/res/images/author.jpg);"></span>Louie Smith</a></h1>
    <nav id="colorlib-main-menu" role="navigation">
        <ul>
            <li class="${pagina.endsWith('/index') ? 'colorlib-active' : ''} ${pagina.endsWith('/') ? 'colorlib-active' : ''} "><a href="${ctx}/">Home</a></li>
            <li class="${pagina.endsWith('/profilo') ? 'colorlib-active' : ''}"><a href="${ctx}/profilo">Profilo</a></li>
            <li class="${pagina.endsWith('/amici') ? 'colorlib-active' : ''}"><a href="${ctx}/amici">Amici</a></li>
            <li class="${pagina.endsWith('/scopri') ? 'colorlib-active' : ''}"><a href="${ctx}/scopri">Scopri</a></li>
            <li class="${pagina.endsWith('/supporto') ? 'colorlib-active' : ''}"><a href="${ctx}/supporto">Supporto</a></li>
            <li class="${pagina.endsWith('/logout') ? 'colorlib-active' : ''}"><a href="${ctx}/logout">Logout</a></li>

            <!-- menu extra -->
            <%--
            <li class="${pagina.endsWith('/template') ? 'colorlib-active' : ''}"><a href="${ctx}/test/template">Template</a></li>
            --%>
        </ul>
    </nav>



    <%--
    <div class="colorlib-footer">
        <h3>Newsletter</h3>
        <div class="d-flex justify-content-center">
            <form action="#" class="colorlib-subscribe-form">
                <div class="form-group d-flex">
                    <div class="icon"><span class="icon-paper-plane"></span></div>
                    <input type="text" class="form-control" placeholder="Enter Email Address">
                </div>
            </form>
        </div>
    </div>
    --%>
</aside> <!-- END COLORLIB-ASIDE -->