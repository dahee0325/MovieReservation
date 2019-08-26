<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVIES : Reserve</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	a {
		display : inline-block;
		width: 100px;
		border: 1px solid #DDD;
		padding: 10px;
		margin: 0 5px;
	}

	a:hover {
		cursor: pointer;
		text-decoration: underline;
	}
</style>
</head>
<body>
	<h1>예매하기</h1>
	<hr>
	<div id="reserve_wrap">
	<div id="reserve_all">
	
	</div>
	
	<div>
		<h2>극장</h2>
		<a onclick="cinema(1)">서울</a>
		<a onclick="cinema(2)">경기</a>
		<a onclick="cinema(3)">부산</a>
	</div>
	<h2>날짜</h2>
	<h3>19년 8월</h3>
	<a onclick="date(1)">24</a>
	<a onclick="date(2)">25</a>
	<a onclick="date(3)">26</a>
	<div>
		<h2>시간/영화</h2>
		<a onclick="time_movie(1)">9:20~11:00 - 애프터</a>
		<a onclick="time_movie(2)">12:10~14:00 - 분노의질주</a>
		<a onclick="time_movie(3)">15:30~17:00 - 봉오동전투</a>
	</div>
	</div>
	<div id="seat_warp" style="display: none;">
		<h2>좌석선택</h2>
		A열<a onclick="seat('a1')">1</a><a onclick="seat('a2')">2</a><a onclick="seat('a3')">3</a><a onclick="seat('a4')">4</a>
		B열<a onclick="seat('b1')">1</a><a onclick="seat('b2')">2</a><a onclick="seat('b3')">3</a><a onclick="seat('b4')">4</a>
	</div>
	<div>
		<form action="post" id="reserveform">
			<input type="text" id="cinema">
			<input type="text" id="date">
			<input type="text" id="time_movie">
			<input type="text" id="seat">
			<input type="button" onclick="seatz()" value="좌석선택">
		</form>
	</div>
	
<script>

	$(document).ready(function(){
        
		list();
		
	});
	
	function list() {

		$.ajax({
			url : 'http://localhost:8080/reserve/',
			type : 'GET',
			success : function(data) {
				
				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div class="r_all">\n';
					html += '티켓코드 : ' + data[i].tidx + ' <br>\n';
					html += '영화코드 : ' + data[i].midx + ' <br>\n';
					html += '상영관코드 : ' + data[i].cidx + ' <br>\n';
					html += '상영날짜 : ' + data[i].cDate + '<br>\n';
					html += '상영시간 : ' + data[i].cTime +" ~ "+data[i].cTime + data[i].runningTime + '<br>\n';
					html += '</div>\n';
				}

				$('#reserve_all').html(html);
			}

		});

	}
	
	function seat(sidx){
		$('#seat').val(sidx);
    }
	
	function seatz(){
		$('#reserve_wrap').css('display', 'none');
		$('#seat_warp').css('display', 'block'); 
    }
	
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