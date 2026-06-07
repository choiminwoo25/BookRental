<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/include/header.css'/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(function() {
        let pathname = $(location).attr("pathname");
        let isIncludeUser = pathname.includes('/user');

        if(isIncludeUser) {
            $('#header_wrap.menu ul li a.user').css('text-decoration', 'green wavy underline');
        } else {
            $('#header_wrap.menu ul li a.admin').css('text-decoration', 'red wavy underline');
        }

    });
</script>
<header>
    <div id="header_wrap">
        <div class="menu">
            <ul>
                <li><a class="user" href="/user/">USER HOME</a></li>
                <li><a class="admin" href="/admin/">ADMIN HOME</a></li>
            </ul>
        </div>
    </div>

    <div class="title">
        <h3>대림대학교 도서관 - 도서 대여 서비스</h3>
    </div>
</header>
