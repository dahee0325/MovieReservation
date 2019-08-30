<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp" %>
<title>Insert title here</title>
<style>
	#main_wrap {
		width: 1200px;
		margin: auto;
	}
	
	a {
		cursor: pointer;
	}
	
	.wrap {
		width: 30%;
		display: inline-block;
		vertical-align: top;
		border: 1px solid #DDD;
		border-radius: 10px;
		padding: 10px;
		margin: 10px;
		height: 220px;
		overflow: auto;
		
	}
	
	#cinemaList_wrap a,#dateList_wrap a, #movieList_wrap a {
		cursor: pointer;
		width: 100%;
		display: inline-block;
		padding: 0 10px;
		font-size: 20px;
		
	}
	
	#cinemaList_wrap a:hover,#dateList_wrap a:hover, #movieList_wrap a:hover {
		border: 1px solid #DDD;
		border-radius: 5px;
		font-weight: bold;
	}
	
	#seatCnt {
		width: 100px;
		height: 100px;
		border: 1px solid #DDD;
		margin: 10px;
		display: inline-block;
	}
	
	input {
		background-color: transparent;
		border: 0;
		width: 10%;
	}
	
	input[type=submit]{
		color: white;
	}
	
	.cClick {
		background-color: white;
	}

	#backBtn, #reserveBtn {
		display: none;
		color: black;
	}
	
	#reserveDiv, #noneReserveDiv {
		text-align: center;
		vertical-align: middle;
		height: 100%;
	}
	
	#reserveDiv{
		background-color: #DDD;
	}
	
	#form_warp {
		
		padding: 15px;
		font-size: 20px;
		
	}

	#backBtn, #seatBtn, #reserveBtn {
		border: 1px solid #DDD;
		width: 120px;
		text-align: center;
	}
	
	#backBtn:hover, #seatBtn:hover, #reserveBtn:hover {
	
		background-color: #DDD;
		color: white;
	
	}
	
	#seatBtn {
		display: inline-block;
	}
	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/frame/nav.jsp" %>
<h2 style="text-align: center;font-family: 'East Sea Dokdo', cursive;font-size:45px;">예매</h2>
	<div id="main_wrap">
		<div id="reserve_wrap">
			<div class="wrap">
				<h3>상영관</h3>
				<div id="cinemaList_wrap"></div>
			</div>
			<div class="wrap">
				<h3>날짜 8월</h3>
				<div id="dateList_wrap">상영관을 선택해주세요.</div>
			</div>
			<div class="wrap">
				<h3>영화/시간</h3>
				<div id="movieList_wrap">상영관과 날짜를 선택해주세요.</div>
			</div>
		</div>
		<div id="seat_warp" style="display: none; border: 1px solid white;">

		</div>
		<div id="form_warp">
			<form action="post" id="reserveform">
				<input type="text" id="idx" placeholder="id">
				<input type="hidden" id="ticket">
				상영관 : <input type="hidden" id="cinema" disabled>
				<input type="text" id="cinemaPrint" disabled style="width: 5%;">
				날짜 : 8월 <input type="text" id="date" disabled style="width: 2%;">일  
				<input type="text" id="time_movie" disabled> 
				좌석번호 : <input type="text" id="seat" disabled>
				<a id="backBtn" onclick="back()">뒤로가기</a>
				<a id="seatBtn" onclick="seat()" >좌석선택</a>
				<input id="reserveBtn" type="submit" value="예약하기">
			</form>
		</div>
	</div>
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<script>
	
		$(document).ready(function() {
			//var data = JSON.parse(sessionStorage.getItem("loginInfo"));
			//$('#idx').val(data.idx);
			
			cinemalist();
			$('#reserveform').submit(function() {
				if ($('#seat').val() == '') {
					alert('좌석을 선택해주세요.');
				}
				$.ajax({
					url : 'http://13.209.47.16:8080/reserve/reserve',
					type : 'POST',
					data : {idx : $('#idx').val(), sidx : $('#seat').val(), tidx : $('#ticket').val()},
					success : function(data) {
						if (data > 0) {
							alert('예매되었습니다.\n메인페이지로 이동합니다.');
							location.href = 'http://localhost:8080/movies'
						}
					}
				});
				return false;
			});

		});

	function cinemalist() {

		$.ajax({
			url : 'http://13.209.47.16:8080/reserve/cinemaList',
			type : 'GET',
			success : function(data) {

				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id="cinemaList">\n';
					html += '<div id="c_wrap">\n';
					html += '<a id="c'+ data[i].cidx +'" onclick="cinemaClick(' + data[i].cidx + ')">'
							+ data[i].cName + '</a>\n';
					html += '</div>\n';
					html += '</div>\n';
				}

				$('#cinemaList_wrap').html(html);

			}

		});

	}

	function cinemaClick(cidx) {

		$('#cinema').val(cidx);
		$('#cinemaPrint').val($('#c'+cidx).html());
		$('#date').val('');
		$('#time_movie').val('');

		$.ajax({
			url : 'http://13.209.47.16:8080/reserve/bycinemaList/' + cidx,
			type : 'GET',
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data) {
				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id="dateList">\n';
					html += '<a onclick="dateClick(' + data[i].tDate + ')">'
							+ data[i].tDate + '</a> <br>\n';
					html += '</div>\n';
				}

				$('#dateList_wrap').html(html);

			}
		});

	}

	function dateClick(cDate) {
		
		$('#date').val(cDate);
		$('#time_movie').val('');

		$.ajax({
			url : 'http://13.209.47.16:8080/reserve/selectTimeList',
			type : 'GET',
			data : {
				cidx : $('#cinema').val(),
				tDate : $('#date').val()
			},
			success : function(data) {
				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id="movieList">\n';
					html += '<a onclick="time_movieClick(\'' + data[i].tTime
							+ '\')">' + data[i].mName + "(" + data[i].tTime
							+ " ~ " + data[i].totalTime + ")" + '</a> <br>\n';
					html += '</div>\n';
				}

				$('#movieList_wrap').html(html);

			}
		});

	}

	function time_movieClick(timeidx) {

		$('#time_movie').val(timeidx);

	}

	function seat() {

		if ($('#cinema').val() == '') {
			alert('상영관을 선택해주세요.');

		} else if ($('#date').val() == '') {
			alert('날짜를 선택해주세요.');

		} else if ($('#time_movie').val() == '') {
			alert('시간을 선택해주세요.');
		} else if($('#idx').val() == '') {
			alert('로그인을 해주세요.\n로그인페이지로 이동합니다.');
			//로그인페이지로 이동
			//location.href = 'http://localhost:8080/movies/confirm';
			
			//var data = JSON.parse(sessionStorage.getItem("loginInfo"));
			//$('#idx').val(data.idx);
		}
		
		
		$.ajax({
			url : 'http://13.209.47.16:8080/reserve/getTicket',
			type : 'GET',
			data : {
				cidx : $('#cinema').val(),
				tDate : $('#date').val(),
				tTime : $('#time_movie').val()
			},
			success : function(data) {

				$('#ticket').val(data);

				$.ajax({
					url : 'http://13.209.47.16:8080/reserve/seat',
					type : 'GET',
					data : {
						cidx : $('#cinema').val(),
						tidx : $('#ticket').val()
					},
					success : function(data) {
						
						if(data.seatCnt == data.reserveTotalCnt) {
							
							alert('모든 좌석이 매진되었습니다.\n다른 시간으로 예매해주세요.');
							$('#seat_warp').css('display', 'none');
							$('#backBtn').css('display', 'none');
							$('#reserveBtn').css('display', 'none');
							$('#seatBtn').css('display','inline-block');
							$('#ticket').val('');
							
						}else {
							$('#reserve_wrap').css('display', 'none');
							
							var html = '';
							
							for (var j = 1; j <= data.seatCnt; j++) {

								html += '<div id="seatCnt">\n';

								var chk = true;

								for (i = 0; i < data.reserveTotalCnt; i++) {
									if (data.sidx[i] == j) {
										html += '<div id="reserveDiv"><br>\n';
										html += j + '<br>\n';
										html += '</div>\n';
										chk = false;
									}
								}

								if (chk) {
									html += '<div id="noneReserveDiv"><br>\n';
									html += '<a onclick="seatNum(' + j + ')">' + j + '</a> <br>\n';
									html += '</div>\n';
								}

								html += '</div>\n';

								$('#seat_warp').html(html);

								$('#seat_warp').css('display', 'block');
								$('#backBtn').css('display', 'inline-block');
								$('#reserveBtn').css('display', 'inline-block');
								$('#seatBtn').css('display', 'none');
							}						
						}

					}

				});
			}
		});
	}
	
	function back() {

		$('#seat_warp').css('display', 'none');
		$('#reserve_wrap').css('display', 'block');
		$('#seat').val('');
		$('#backBtn').css('display', 'none');
		$('#reserveBtn').css('display', 'none');
		$('#seatBtn').css('display','inline-block');
		
	}

	function seatNum(seatNum) {

		$('#seat').val(seatNum);

	}
</script>
</body>
</html>
