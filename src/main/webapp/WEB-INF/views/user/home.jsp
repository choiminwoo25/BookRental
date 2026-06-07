<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../include/title.jsp" />
    <link href="<c:url value='/resources/css/user/home.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<jsp:include page="./include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>사용자 홈 화면</h3>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />
</body>
</html>
