<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <h1>로그인</h1>
    <form method="POST" action="/login">
        <table>
            <tr>
                <td>아이디:</td>
                <td><input type="text" name="userid" /></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><input type="password" name="password" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="로그인" /></td>
            </tr>
        </table>
        <a href="/home">홈페이지 이동</a>
    </form>
</body>
</html>