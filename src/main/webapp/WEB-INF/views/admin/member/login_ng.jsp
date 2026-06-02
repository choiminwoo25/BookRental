<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26. 5. 8.
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../../include/title.jsp" />
    <link href="<c:url value='/resources/css/admin/login_result.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>LOGIN FAIL!!!!</h3>
            <span>(만약 관리자 회원가입을 했다면, 최고 관리자한테 승인 요청 후 로그인하세요.)</span>
        </div>

        <div class="others">
            <a href="/admin/member/createAccountForm">create account</a>
            <a href="/admin/member/loginForm">login</a>
        </div>

    </div>


</section>
<jsp:include page="../../include/footer.jsp" />
</body>
</html>
