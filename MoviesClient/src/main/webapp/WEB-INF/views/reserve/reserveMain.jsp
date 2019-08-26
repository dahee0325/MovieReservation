<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<style>
	.wrap {
		width: 30%;
		display: inline-block;
		vertical-align: top;
	}
</style>
<body class="landing-page landing-page2">
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
<div class="main" style="background-image: url('images/main.png')">
    <div class="cover black" data-color="black"></div>
    <div class="container">
        <h2 class="logo cursive" style="font-size: 30px;">
            	RESERVE
        </h2>
        <div class="content">
            <div class="subscribe">
                <div class="motto">
						<div id="reserve_wrap">
							<div class="wrap">
								<h3>상영관</h3>
								<div id="cinemaList_wrap"></div>
							</div>
							<div class="wrap">
								<h3>날짜</h3>
								<div id="dateList_wrap"></div>
							</div>
							<div class="wrap">
								<h3>영화/시간</h3>
								<div id="movieList_wrap"></div>
							</div>
						</div>
						<div>
							<form action="post" id="reserveform">
								<input type="text" id="cinema"> <input type="text"
									id="date"> <input type="text" id="time_movie">
								<input type="text" id="seat"> <input type="button"
									onclick="seatz()" value="좌석선택">
							</form>
						</div>
					</div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
 </div>
 <script>

	$(document).ready(function(){
        
		cinemalist();
		dateList();
		movieList();
		
	});
	
	function cinemalist() {

		$.ajax({
			url : 'http://localhost:8080/reserve/cinemaList',
			type : 'GET',
			success : function(data) {
				
				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id="cinemaList">\n';
					html += '<a href="#" onclick="cinema('+data[i].cidx+')">' + data[i].cidx + '</a> <br>\n';
					html += '</div>\n';
				}

				$('#cinemaList_wrap').html(html);
			}

		});

	}
	
	function dateList() {

		$.ajax({
			url : 'http://localhost:8080/reserve/dateList',
			type : 'GET',
			success : function(data) {
				
				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id="dateList">\n';
					html += '<a href="#" onclick="date('+data[i].cDate+')">' + data[i].cDate + '</a> <br>\n';
					html += '</div>\n';
				}

				$('#dateList_wrap').html(html);
			}

		});

	}
	
	function movieList() {

		$.ajax({
			url : 'http://localhost:8080/reserve/movieList',
			type : 'GET',
			success : function(data) {
				
				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id="movieList">\n';
					html += '<a href="#" onclick="time_movie('+data[i].midx+')">' + data[i].midx + "(" + data[i].cTime +" ~ "+ data[i].totalTime +")"+ '</a> <br>\n';
					html += '</div>\n';
				}

				$('#movieList_wrap').html(html);
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
