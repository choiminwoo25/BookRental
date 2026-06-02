<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26. 4. 28.
  Time: 오후 4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/admin/include/nav.css'/>" rel="stylesheet">
<nav>
  <div id="nav_wrap">
    <div class="menu">
      <ul>
        <li><a href="#">로그아웃</a></li>
        <li><a href="#">계정수정</a></li>
        <li><a href="#">대출도서</a></li>
        <li><a href="#">전체도서</a></li>
        <li><a href="#">희망도서</a></li>
        <li><a href="#">도서등록</a></li>
      </ul>
    </div>

    <div class="search">
      <form name="search_book_form" action="/book/admin/searchbox">
        <input type="text" name="b_name" placeholder="Enter the name of the book you are looking for.">
        <input type="button" value="search" onclick="searchBook()">
      </form>
    </div>
  </div>
</nav>
<script type="text/javascript">
  function searchBook() {
    console.log('searchBook() --->');
    let form = document.search_book_form;
    if(form.b_name.value == '') {
      alert('Enter the name of the book you are looking for.');
      form.b_name.focus();
    } else {
      form.submit();
    }
  }
</script>
