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
                <td>아이디</td>
                <td><form:input path="userid" pattern="^(?=.*[a-z])[a-z0-9]{5,11}$" required="true" placeholder="로그인 아이디" title="아이디를 확인하세요" /></td>
                <td><button id="userid_confirm">아이디 확인</button></td>
                <td><input type="text" id="bDuplicate" name="bDuplicate" hidden /></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><form:input path="nickname" pattern=".{2,8}" required="true" placeholder="사용 할 닉네임" title="닉네임을 확인하세요" /></td>    
                <td><button id="nickname_confirm">닉네임 확인</button></td>   
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><form:password path="password" /></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" id="password2" name="password2" placeholder="비밀번호를 한번 더 입력해주세요." /></td>
            </tr>            
            <tr>
                <td>이름</td>
                <td><form:input path="realName" /></td>
            </tr>
            <tr>
                <td>휴대폰</td>
                <td><form:input path="phoneNumber" pattern="^(010)[0-9]{3,4}[0-9]{4}$" required="true" title="휴대폰번호를 확인하세요" /></td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><form:input path="email" pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" required="true" title="이메일 형식을 확인하세요"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" id="submit" name="submit" value="회원가입" />
                    <input type="reset" value="초기화" /></td>            
            </tr>
        </table>
    </form:form>
</body>
</html>
<script>

$('#userid_confirm').on('click', function(){
	if($('#userid').val()=='') {
        alert('아이디를 입력하세요');
        return false;
    }
	else {
        $.post('/checkDupId',{userid:$('#userid').val()},function(data){
            if(data=='true'){
                alert('이미 사용중인 아이디입니다.');
            } else if(!/^(?=.*[a-z])[a-z0-9]{5,11}$/.test($('#userid').val())) {
                alert('아이디는 영소문자와 숫자만 허용되며 5~11글자로 제한됩니다. 또한 영소문자가 반드시 포함되어야 합니다.');
            } else {
                alert('사용 가능한 아이디입니다.');
                $('#bDuplicate').val("${user.userid}");
            }
        },'text')
        return false;
    }
})

$('#nickname_confirm').on('click', function(){
	if($('#nickname').val()=='') {
        alert('닉네임을 입력하세요');
        return false;
    }
	else {
        $.post('/checkDupNick',{nickname:$('#nickname').val()},function(data){
            if(data=='true'){
                alert('이미 사용중인 닉네임입니다.');
            } else if($('#nickname').val().length > 8 || $('#nickname').val().length < 2) {
                alert('닉네임은 2~8글자로 제한됩니다');
            } else {
                alert('사용 가능한 닉네임입니다.');
            }
        },'text')
        return false;
    }
})

$('#submit').on('click', function() {
    var password = $('#password').val();
    var password2 = $('#password2').val();
    if (password !== password2) {
        alert('비밀번호가 일치하지 않습니다.');
        return false;
    } else if(password.length>10 || password.length<4) {
        alert('비밀번호는 4~10글자로 제한됩니다');
        return false;
    }
});


</script>