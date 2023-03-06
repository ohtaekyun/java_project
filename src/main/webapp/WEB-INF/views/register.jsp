<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>
    <a href="/home">홈페이지로</a>
    <form:form method="POST" modelAttribute="user">
        <table>
            <tr>
                <td>아이디:</td>
                <td><form:input path="userid" /></td>
                <td><button id="userid_confirm">아이디 중복 확인</button></td>
                
            </tr>
            <tr>
                <td>닉네임:</td>
                <td><form:input path="nickname" /></td>
                <td><button id="nickname_confirm">닉네임 중복 확인</button></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><form:password path="password" /></td>
            </tr>
            <tr>
                <td>비밀번호 확인:</td>
                <td><input type="password" id="password2" name="password2" /></td>
                <td><button id="password_confirm">비밀번호 일치 확인</button></td>
                <td>${user.userid}</td>
                
            </tr>            
            <tr>
                <td>이름:</td>
                <td><form:input path="realName" /></td>
            </tr>
            <tr>
                <td>핸드폰 번호:</td>
                <td><form:input path="phoneNumber" /></td>
            </tr>
            <tr>
                <td>E-mail:</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td colspan="4"><input type="submit" id="submit" name="submit" value="회원가입" />
                    <input type="reset" value="리셋" /></td>                
            </tr>
        </table>
    </form:form>
</body>
</html>
<script>
$('#password_confirm').on('click', function() {
    var password = $('#password').val();
    var password2 = $('#password2').val();
    if (password !== password2) {
        alert('비밀번호가 일치하지 않습니다.');
        return false;
    } else {
        alert('비밀번호가 일치합니다');
        return false;
    }
});
$('#userid_confirm').on('click', function() {
    var userid = $('#userid').val();
    if (userid == '') {
        alert('아이디를 입력하세요');
        return false;
    } else {
        alert('아이디를 사용할 수 있습니다');
        return false;
    }
});
$('#submit').on('click', function() {
    if ($('#userid').val() == '' || $('#nickname').val()=='' || $('#password').val()=='') {
        alert('빈 칸을 채워주세요');
        return false;
    } 
});
</script>