<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/frame/nav.jsp" %>
<h2 style="text-align: center;font-family: 'East Sea Dokdo', cursive;font-size:45px;">예매확인</h2>
	<div id="main_wrap">
		OO님 예약확인 정보
		<div id="reserve_wrap">
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<script>

		$(document).ready(function() {
			
			reservelist();
			
		});
		
		
		function reservelist() {

			$.ajax({
				url : 'http://localhost:8080/reserve/reserveInfo',
				type : 'GET',
				success : function(data) {

					
				}

			});

		}
		
		
	</script>
</body>
</html>
