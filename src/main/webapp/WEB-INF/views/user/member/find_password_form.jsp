<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../../include/title.jsp" />
    <link href="<c:url value='/resources/css/user/find_password_form.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>FIND PASSWORD FORM</h3>
        </div>

        <div class="find_password_form">
            <form action="#" name="find_password_form" method="post">
                <input type="text" name="id" placeholder="INPUT USER ID."><br/>
                <input type="text" name="name" placeholder="INPUT USER NAME."><br/>
                <input type="email" name="email" placeholder="INPUT USER MAIL."><br/>

                <input type="button" value="find password" onclick="findPassword()">
                <input type="reset" value="reset">
            </form>
        </div>

        <div class="create_account_login">
            <a href="/user/account/createAccountForm">create account</a>
            <a href="/user/account/loginForm">login</a>
        </div>
    </div>
</section>

<jsp:include page="../../include/footer.jsp" />

<script type="text/javascript">
    function findPassword() {
        let form = document.find_password_form;

        if(form.id.value == '') { alert('INPUT USER ID.'); form.id.focus(); }
        else if(form.name.value == '') { alert('INPUT USER NAME.'); form.name.focus(); }
        else if(form.email.value == '') { alert('INPUT USER MAIL.'); form.email.focus(); }
        else { form.submit(); }
    }
</script>
</body>
</html>
