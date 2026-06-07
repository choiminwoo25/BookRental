<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../../include/title.jsp" />
    <link href="<c:url value='/resources/css/user/modify_account_form.css'/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../include/nav.jsp" />

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>MODIFY ACCOUNT FORM</h3>
        </div>

        <div class="modify_account_form">
            <form action="/user/account/modifyAccount" name="modify_account_form" method="post">
                <input type="text" name="id" value="${userAccountVo.id}" readonly><br/>
                <input type="password" name="pw" value="" placeholder="비밀번호 수정 불가" readonly><br/>
                <input type="text" name="name" value="${userAccountVo.name}" placeholder="INPUT USER NAME."><br/>
                <select name="gender">
                    <option value="M" ${userAccountVo.gender == 'M' ? 'selected' : ''}>Man</option>
                    <option value="W" ${userAccountVo.gender == 'W' ? 'selected' : ''}>Woman</option>
                </select><br/>
                <input type="email" name="email" value="${userAccountVo.email}" placeholder="INPUT USER MAIL."><br/>
                <input type="text" name="phone" value="${userAccountVo.phone}" placeholder="INPUT USER PHONE."><br/>

                <input type="button" value="modify account" onclick="modifyAccount()">
                <input type="reset" value="reset">
            </form>
        </div>
    </div>
</section>

<jsp:include page="../../include/footer.jsp" />

<script type="text/javascript">
    function modifyAccount() {
        let form = document.modify_account_form;

        if(form.name.value == '') { alert('INPUT USER NAME.'); form.name.focus(); }
        else if(form.gender.value == '') { alert('SELECT USER GENDER.'); form.gender.focus(); }
        else if(form.email.value == '') { alert('INPUT USER MAIL.'); form.email.focus(); }
        else if(form.phone.value == '') { alert('INPUT USER PHONE.'); form.phone.focus(); }
        else { form.submit(); }
    }
</script>
</body>
</html>
