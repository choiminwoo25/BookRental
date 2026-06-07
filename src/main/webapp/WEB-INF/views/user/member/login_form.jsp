<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../../include/title.jsp" />
    <link href="<c:url value='/resources/css/user/login_form.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>LOGIN FORM</h3>
        </div>

        <c:if test="${not empty errorMsg}">
            <div class="error" style="color:red; text-align:center;">${errorMsg}</div>
        </c:if>

        <div class="login_form">
            <form action="/user/account/doLogin" name="login_form" method="post">
                <input type="text" name="id" placeholder="INPUT USER ID."><br/>
                <input type="password" name="pw" placeholder="INPUT USER PW."><br/>

                <input type="button" value="login" onclick="login()">
                <input type="reset" value="reset">
            </form>
        </div>

        <div class="find_password_create_account">
            <a href="/user/account/findPasswordForm">find password</a>
            <a href="/user/account/createAccountForm">create account</a>
        </div>
    </div>
</section>
<jsp:include page="../../include/footer.jsp" />

<script type="text/javascript">
    function login() {
        let form = document.login_form;

        if(form.id.value == '') {
            alert('INPUT USER ID.');
            form.id.focus();
        } else if(form.pw.value == '') {
            alert('INPUT USER PW.');
            form.pw.focus();
        } else {
            form.submit();
        }
    }
</script>
</body>
</html>
