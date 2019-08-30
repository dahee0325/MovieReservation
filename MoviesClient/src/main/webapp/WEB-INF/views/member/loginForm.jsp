<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>MOVIES :: LOGIN</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	#contents{
		width : 900px;
		margin : auto;
	}
	
	#loginform {
		width : 300px;
		margin: auto;
	}
	
	#logintitle {
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
		<h3 id= logintitle>로그인 페이지</h3>
		<hr>
		<form id="loginform">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uId" id="uId" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="uPw" id="uPw" required>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="로그인">
				</tr>
			</table>
		</form>
	</div>

	<script>
		$(document).ready(function() {

			$('#loginform').submit(function() {

				$.ajax({
					url : 'http://13.125.149.225:8080/users/member/login',
					type : 'POST',
					data : {
							uId : $('#uId').val(),
							uPw : $('#uPw').val()
							},
					/* dataType : 'text', */
					success : function(data) {
						
						if (data.idx == null) {
							alert("로그인 실패.");
							
						} else if (data != null){
							alert("로그인 되었습니다." );
							sessionStorage.setItem('loginInfo',  JSON.stringify(data));
							
							var data = JSON.parse(sessionStorage.getItem("loginInfo"));
							
							location.href = '/movies/main';
							
							$('#login').css("display","none");
						}
					},
					error : function(data) {
						alert(data);
					}
				});				
				return false;
			})
			
			
		});
	</script>

</body>
</html>