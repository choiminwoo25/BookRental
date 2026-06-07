<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <jsp:include page="../../include/title.jsp" />
    <link href="<c:url value='/resources/css/user/create_account_form.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>CREATE ACCOUNT FORM</h3>
        </div>

        <div class="create_account_form">
            <form:form action="/user/account/createAccountForm" modelAttribute="userAccountVo" name="create_account_form" method="post">
                <div class="field-wrap"><form:input path="id" placeholder="INPUT USER ID." /><span class="err"><form:errors path="id" /></span></div>
                <div class="field-wrap"><form:password path="pw" placeholder="INPUT USER PW." /><span class="err"><form:errors path="pw" /></span></div>
                <div class="field-wrap"><input type="password" name="password_again" placeholder="INPUT USER PW AGAIN."></div>
                <div class="field-wrap"><form:input path="name" placeholder="INPUT USER NAME." /><span class="err"><form:errors path="name" /></span></div>
                <div class="field-wrap"><form:select path="gender"><form:option value="">SELECT USER GENDER.</form:option><form:option value="M">Man</form:option><form:option value="W">Woman</form:option></form:select><span class="err"><form:errors path="gender" /></span></div>
                <div class="field-wrap"><form:input path="email" placeholder="INPUT USER MAIL." /><span class="err"><form:errors path="email" /></span></div>
                <div class="field-wrap"><form:input path="phone" placeholder="INPUT USER PHONE." /><span class="err"><form:errors path="phone" /></span></div>
                <input type="button" value="create account" onclick="createAccount()">
                <input type="reset" value="reset">
            </form:form>
        </div>

        <div class="login">
            <a href="/user/account/loginForm">login</a>
        </div>
    </div>
</section>
<jsp:include page="../../include/footer.jsp" />

<script type="text/javascript">
    function createAccount() {
        let form = document.create_account_form;

        if(form.password_again.value == '') { alert('INPUT USER PW AGAIN.'); form.password_again.focus(); }
        else if(form.pw.value != form.password_again.value) { alert('PW NOT MATCH.'); form.pw.focus(); }
        else { form.submit(); }
    }
</script>
</body>
</html>
