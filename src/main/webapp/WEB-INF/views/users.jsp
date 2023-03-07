<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>회원목록</title>
  </head>
  <body>
    <h1>회원목록</h1>
    <table>
      <tr>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>실명</th>
        <th>핸드폰번호</th>
        <th>이메일</th>
      </tr>
      <c:forEach var="user" items="${userList}">
        <tr>
          <td>${user.userid}</td>
          <td>${user.password}</td>
          <td>${user.nickname}</td>
          <td>${user.realName}</td>
          <td>${user.phoneNumber}</td>
          <td>${user.email}</td>
        </tr>
      </c:forEach>
    </table>
    <a href="/home">홈페이지 이동</a>
  </body>
</html>