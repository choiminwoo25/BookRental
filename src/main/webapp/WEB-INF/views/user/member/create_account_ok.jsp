<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../../include/title.jsp" />
    <link href="<c:url value='/resources/css/user/create_account_result.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>CREATE ACCOUNT SUCCESS</h3>
        </div>
        <div class="result">
            <p>회원가입이 완료되었습니다.</p>
            <a href="/user/account/loginForm">로그인 하러 가기</a>
        </div>
    </div>
</section>

<jsp:include page="../../include/footer.jsp" />
</body>
</html>
