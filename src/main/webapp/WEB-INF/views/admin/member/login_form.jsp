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
    <link href="<c:url value='/resources/css/admin/login_form.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>LOGIN FORM</h3>
        </div>

        <div class="create_account_form">
            <form action="/admin/member/doLogin" name="login_form" method="post">
                <input type="text" name="id" placeholder="input admin id"><br/>
                <input type="password" name="password" placeholder="input admin password"><br/>


                <input type="button" value="login" onclick="login()">
                <input type="reset" value="reset">
            </form>
        </div>

        <div class="find_password_create_account">
            <a href="#">find password</a>
            <a href="#">create account</a>
        </div>
    </div>
</section>
<jsp:include page="../../include/footer.jsp" />

<script type="text/javascript">
    function login() {
        let form = document.login_form;

        if(form.id.value == '') {
            alert('input admin id');
            form.id.focus();
        } else if(form.password.value == '') {
            alert('input admin password');
            form.password.focus();
        } else {
            form.submit();
        }
    }
</script>
</body>
</html>
