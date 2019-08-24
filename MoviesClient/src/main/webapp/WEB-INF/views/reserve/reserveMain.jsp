<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVIES : Reserve</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1>예매하기</h1>
	<hr>
	<div>
		<h2>극장</h2>
		<button onclick="cinema(1)">서울</button>
		<button onclick="cinema(2)">경기</button>
		<button onclick="cinema(3)">부산</button>
	</div>
	<h2>날짜</h2>
	<h3>19년 8월</h3>
	<button onclick="date(1)">24</button>
	<button onclick="date(2)">25</button>
	<button onclick="date(3)">26</button>
	<div>
		<h2>시간/영화</h2>
		<button onclick="time_movie(1)">9:20~11:00 - 애프터</button>
		<button onclick="time_movie(2)">12:10~14:00 - 분노의질주</button>
		<button onclick="time_movie(3)">15:30~17:00 - 봉오동전투</button>
	</div>
	<div>
		<input type="text" id="cinema">
		<input type="text" id="date">
		<input type="text" id="time_movie">
		<input type="submit" value="좌석선택">
	</div>
	
<script>

	$(document).ready(function(){
        
       
		
	});
	
	function cinema(cidx){
		
		$('#cinema').val(cidx);
       
    }
	
	function date(didx){
		
		$('#date').val(didx);
       
    }
	
	function time_movie(tidx){
		
		$('#time_movie').val(tidx);
       
    }
	
</script>
</body>
</html>