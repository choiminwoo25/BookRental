<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26. 4. 28.
  Time: 오후 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../include/title.jsp" />
    <link href="<c:url value='/resources/css/admin/home.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<jsp:include page="./include/nav.jsp" />

<section>
  <div id="section_wrap">
    <div class="word">
      <h3>ADMIN HOME</h3>
    </div>
  </div>
</section>
<jsp:include page="../include/footer.jsp" />
</body>
</html>
