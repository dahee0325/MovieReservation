<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVIES :: 회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet"
	type="text/css">
<style>
#idcheck {
	display: none;
}

.color_red {
	color: red;
}

.color_blue {
	color: blue;
}

#contents{
		width : 900px;
		margin : auto;
	}
	
	#regForm{
		width : 500px;
		margin: auto;
	}
	
#registtitle {
		margin : 30px 0px ;
		font-family: Arial ;
		font-size: 30px;
	}

</style>
</head>
<body>
<!-- 헤더 -->
<%@include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 네이게이션 -->
<%@include file="/WEB-INF/views/frame/nav.jsp" %>

<!-- 컨텐트 시작 -->
	<div id="contents">
		<h3 id=registtitle>회원가입 페이지</h3>
		<hr>
		<form id="regForm">
			<table>
				<tr>
					<td>아이디(이메일)</td>
					<td><input type="checkbox" id="idcheck"> <input
						type="email" id="uId" name="uId" required> <span
						id="idcheckmsg"></span></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="uPw" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="uName" required></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>

	<script>
		$(document).ready(function() {

			$('#uId').focusout(function() {

				// aJax 비동기 통신 id 전송 사용 유무에 대한 결과 값을 반환

				$.ajax({
					url : 'http://13.125.149.225:8080/users/member/idCheck',
					type : 'get',
					data : {id : $(this).val()},
					success : function(data) {
						//alert(data);

						$('#idcheckmsg').html('');
						$('#idcheckmsg').removeClass('color_red');
						$('#idcheckmsg').removeClass('color_blue');

						if (data == 'Y') {
							$('#idcheck').prop('checked', true);
							$('#idcheckmsg').html('사용 가능한 아이디입니다.');
							$('#idcheckmsg').addClass('color_blue');
						} else {
							$('#idcheck').prop('checked', false);
							$('#idcheckmsg').html('이미 사용중인 아이디입니다.');
							$('#idcheckmsg').addClass('color_red');
						}
					}
				});

				$('#regform').submit(function() {

					if (!$('#idcheck').prop('checked')) {
						alert('아이디 중복확인이 필요합니다.');
						return false;
					}

				});

			});

		});
	</script>
	
	<script>
	$(document).ready(function(){
        
        $('#regForm').submit(function(){
                 
        	$.ajax({
                url : 'http://13.125.149.225:8080/users/member/regist',
                type : 'POST',
                data : $('#regForm').serialize(),
                enctype: 'multipart/form-data',
                success : function(data){
                    alert(data);
                    location.href="/main"
                }
            });
            
            return false;
        });
		
		
	});
</script>



</body>
</html>