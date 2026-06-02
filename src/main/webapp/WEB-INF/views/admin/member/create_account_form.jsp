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
    <link href="<c:url value='/resources/css/admin/create_account_form.css'/>" rel="stylesheet">
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
            <form action="/admin/member/createAccount" name="create_account_form" method="post">
                <input type="text" name="id" placeholder="input admin id"><br/>
                <input type="password" name="password" placeholder="input admin password"><br/>
                <input type="password" name="password_again" placeholder="input admin password again"><br/>
                <input type="text" name="name" placeholder="input admin name"><br/>
                <select name="gender">
                    <option value="">select admin gender</option>
                    <option value="M">Man</option>
                    <option value="W">Woman</option>
                </select>
                <br/>
                <input type="text" name="part" placeholder="input admin part"><br/>
                <input type="text" name="position" placeholder="input admin position"><br/>
                <input type="email" name="email" placeholder="input admin email"><br/>
                <input type="text" name="phone" placeholder="input admin phone"><br/>

                <input type="button" value="create account" onclick="createAccount()">
                <input type="reset" value="reset">
            </form>
        </div>

        <div class="login">
            <a href="#">login</a>
        </div>
    </div>
</section>
<jsp:include page="../../include/footer.jsp" />

<script type="text/javascript">
    function createAccount() {
        console.log('createAccount() ---->');
        let form = document.create_account_form;

        if(form.id.value == '') { alert('input admin id'); form.id.focus();}
        else if(form.password.value == '') { alert('input admin password'); form.pssword.focus(); }
        else if(form.password_again.value == '') { alert('input admin password again'); form.password_again.focus(); }
        else if(form.name.value == '') { alert('input admin name'); form.name.focus(); }
        else {
            console.log(form.id.value);
            console.log(form.name.value);
            form.submit();
        }
    }
</script>
</body>
</html>
