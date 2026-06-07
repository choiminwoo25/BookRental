<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/user/include/nav.css'/>" rel="stylesheet">
<nav>
  <div id="nav_wrap">
    <div class="menu">
      <ul>
        <c:choose>
          <c:when test="${not empty sessionScope.loginedUser}">
            <li><a href="/user/account/logout">로그아웃</a></li>
            <li><a href="/user/account/modifyAccountForm">계정수정</a></li>
            <li><a href="#">나의책장</a></li>
          </c:when>
          <c:otherwise>
            <li><a href="/user/account/loginForm">로그인</a></li>
            <li><a href="/user/account/createAccountForm">회원가입</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>

    <div class="search">
      <form name="search_book_form" action="/book/user/searchbox">
        <input type="text" name="b_name" placeholder="Enter the name of the book you are looking for.">
        <input type="button" value="search" onclick="searchBook()">
      </form>
    </div>
  </div>
</nav>
<script type="text/javascript">
  function searchBook() {
    let form = document.search_book_form;
    if(form.b_name.value == '') {
      alert('Enter the name of the book you are looking for.');
      form.b_name.focus();
    } else {
      form.submit();
    }
  }
</script>
