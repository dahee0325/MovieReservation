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
		border: 1px solid #DDD;
		border-radius: 10px;
		padding: 10px;
		margin: 10px;
		
	}
	
	a {
		cursor: pointer;
	}
	
	a:hover {
	
		text-decoration: underline;
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

</style>
<body class="landing-page landing-page2">
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
<div class="main" style="background-image: url('images/main.png')">
    <div class="cover black" data-color="black"></div>
    <div class="container">
        <h2 class="logo cursive" style="font-size: 30px;">
            	reserve
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
								<div id="dateList_wrap">
									상영관을 선택해주세요.
								</div>
							</div>
							<div class="wrap">
								<h3>영화/시간</h3>
								<div id="movieList_wrap">
									상영관과 날짜를 선택해주세요.
								</div>
							</div>
						</div>
						<div id="seat_warp" style="display: none; border: 1px solid white;">

						</div>
						<div>
							<form action="post" id="reserveform">
								<input type="hidden" id="ticket">
								상영관 : <input type="text" id="cinema" disabled style="width: 5%;">
								날짜 : <input type="text" id="date" disabled style="width: 3%;">일<br>
								시간 : <input type="text" id="time_movie" disabled>
								좌석번호 : <input type="text" id="seat" disabled>
								<a onclick="back()">뒤로가기</a>
								<a onclick="seat()" id="seat">좌석선택</a>
								<input type="submit" value="예약하기">
							</form>
						</div>
					</div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
 </div>
	<script>

	$(document).ready(function() {

		cinemalist();
		
		$('#reserveform').submit(function()  {
	        
			if($('#seat').val()==''){
				alert('좌석을 선택해주세요.');
			}
			
	        $.ajax({
	            url : 'http://localhost:8080/reserve/reserve',
	            type : 'POST',
	            data : {
	            	sidx : $('#seat').val(),
	            	tidx : $('#ticket').val()
	    	    },
	            success : function(data){
	                if(data>0) {
	                	alert('예매되었습니다.\n예매확인창으로 이동합니다.');
	                	location.href='http://localhost:8080/movies/reserve/confirm';
	                }
	            }
	        });
	        
	        return false;
	    });
		
		
		$(".ci").on("click", function(){ 
			
			alert('gd');
			//cinemaClick(this.html());
			
		});
		
	});
	
	function cinemalist() {

			$.ajax({
				url : 'http://localhost:8080/reserve/cinemaList',
				type : 'GET',
				success : function(data) {

					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div id="cinemaList">\n';
						html += '<div id="c_wrap">\n';
						html += '<a id="c'+ data[i].cidx +'" onclick="cinemaClick('+data[i].cidx+')">'+data[i].cidx+'</a>\n';
						html += '</div>\n';
						html += '</div>\n';
					}
					
					$('#cinemaList_wrap').html(html);
					
				}

			});

		}

		
		function cinemaClick(cidx) {
						
			$('#cinema').val(cidx);

			//$('#c'+cidx).parents('#c_wrap').addClass('cClick');
			//$('#c'+cidx).parents('#c_wrap').siblings().removeClass('cClick');
			
			$.ajax({
				url : 'http://localhost:8080/reserve/bycinemaList/' + cidx,
				type : 'GET',
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				success : function(data) {
					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div id="dateList">\n';
						html += '<a onclick="dateClick(' + data[i].tDate+ ')">' + data[i].tDate + '</a> <br>\n';
						html += '</div>\n';
					}
					
					$('#dateList_wrap').html(html);
					
				}
			});

		}

		function dateClick(cDate) {
			
			$('#date').val(cDate);
			
			$.ajax({
				url : 'http://localhost:8080/reserve/selectTimeList',
				type : 'GET',
				data : {
					cidx : $('#cinema').val(),
					tDate : $('#date').val()
					},
				success : function(data) {
					var html = '';
					
					for (var i = 0; i < data.length; i++) {
						html += '<div id="movieList">\n';
						html += '<a onclick="time_movieClick(\''+ data[i].tTime +'\')">'
								+ data[i].midx + "(" + data[i].tTime + " ~ "
								+ data[i].totalTime + ")" + '</a> <br>\n';
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
			
			if($('#cinema').val()=='') {
				alert('상영관을 선택해주세요.');
		
			}else if($('#date').val()=='') {
				alert('날짜를 선택해주세요.');

			}else if($('#time_movie').val()=='') {
				alert('시간을 선택해주세요.');
			}
			
			
			$.ajax({
				url : 'http://localhost:8080/reserve/getTicket',
				type : 'GET',
				data : {
					cidx : $('#cinema').val(),
					tDate : $('#date').val(),
					tTime : $('#time_movie').val()
					},
				success : function(data) {
					
					$('#ticket').val(data);
					$('#reserve_wrap').css('display', 'none');

					$.ajax({
						url : 'http://localhost:8080/reserve/seat',
						type : 'GET',
						data : {
							cidx : $('#cinema').val(),
							tidx : $('#ticket').val()
							},
						success : function(data) {
							var html = '';
							
							for (var j = 1; j <= data.seatCnt; j++) {
								
								html += '<div id="seatCnt">\n';
								
								var chk = true;
								
								for(i=0; i<data.reserveTotalCnt; i++){
									if(data.sidx[i] == j){
										html += j+'<br>\n';
										chk = false;
									}
								}
								
								if(chk){
									html += '<a onclick="seatNum(' + j + ')">'+ j + '</a> <br>\n';
								}
								
								
								html += '</div>\n';
								
								$('#seat_warp').html(html);

								$('#seat_warp').css('display', 'block');
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

		}

		function seatNum(seatNum) {

			$('#seat').val(seatNum);

		}
	</script>
</body>
</html>
