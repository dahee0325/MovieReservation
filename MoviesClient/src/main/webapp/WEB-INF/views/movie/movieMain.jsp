<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<title>MOVIES</title>
<style>
#MovieList {
	text-align: center;
}
.modal-content {
	width: 850px;
	margin-left: -150px;
	
}

.movie {
	float: left;
	width : 25%;
	font-size: 20px;
	margin-left: 70px;
	font-weight: bold;
	padding-bottom: 20px;
}

.movie span{
	margin-left: 48px;
}
.modal-body img {
	width: 600px;
	height: 500px;
}

.movie img {
	width: 400px;
	height: 400px;
	padding: 20px;
}

#review {
	margin: 0 auto;
}

#reviewList {
	margin: 0 auto;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	color: black;
}

#reviewListHeader {
	font-size: 30px;
	font-weight: bold;
	color: black;
	text-align: center;
}
#reviewtable td{
	margin-right: 5px;
}

#reviewtable {
	margin: 0 auto;
	font-size: 25px;
	font-weight: bold;
	color: black;
	
}

#movie_wrap {
	width: 1300px;
	margin: auto;
}

input[type=text]{
	border-radius: 8px;
	
}

input[type=submit]{
	background-color: black;
	color: white;
	text-align: center;
	border-radius: 8px;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/nav.jsp"%>
	<h2
		style="text-align: center; font-family: 'East Sea Dokdo', cursive; font-size: 45px;">Movie</h2>
	<div id="movie_wrap">
	<div id="MovieList"></div>
	<div id="ol" style="font-size: 50px;"></div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">영화 상세 정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="mo"
						style="text-align: center; font-size: 20px; margin-bottom: 10px; margin-left: 20px">
					</div>
					<div id="reviewListHeader">
						<hr>
						한줄평
						<hr>
					</div>
					<form id="review">
						<table id="reviewtable">

						</table>
					</form>
					<br>
					<hr>
					<table id="reviewList">

					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">예매 하러 가기</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<script>
		$(document).ready(
				function() {

					$.ajax({
						url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie',
						type : 'GET',
						success : function(data) {
							var html = '';

							for (var i = 0; i < data.length; i++) {
								html += '<div class="movie">\n';
								
								html += '<img onclick="movie('+ data[i].midx + ')" src="http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/uploadfile/' + data[i].mPhoto+ '"><br>';
								html += '<span>' + data[i].mName + ' </span>';
								html += '</div>\n';
							}

							$('#MovieList').html(html);

						}
					});
					
					
					
					
					
				});
		
		$('#review').submit(function(){
			$.ajax({
				url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/review',
				type : 'POST',
				data : $('#review').serialize(),
				success : function(data) {
					alert('한줄평이 입력되어버렷다구~삭제는 너가못한다구~');
					movie($('#midx').val());
				}
			});
			return false; 
		});
		
		function movie(midx) {

			$.ajax({
				url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie/' + midx,
				type : 'GET',
				success : function(data) {
					$('div.modal').modal();
					var html = '';
					html += '<img src="http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/uploadfile/' + data.mPhoto+ '">';
					html += '<div style="margin-bottom: 10px;">\n';
					html += '영화제목 : ' + data.mName + ' </div>';
					html += '<div style="margin-bottom: 10px;">\n감독/배우 : '
							+ data.mPer + ' </div>';
					html += '<div style="margin-bottom: 10px;">\n개봉일 : '
							+ data.mDate + '</div>';
					html += '<div style="margin-bottom: 10px;">\n상영시간 : '
								+ data.mRunTime + '분</div>';								
					html += '<div style="margin-bottom: 10px;">\n줄거리 : '
							+ data.mCont + ' </div>';

					$('#mo').html(html);
				}

			});
				
			$.ajax({
				url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/review/' + midx,
				type : 'GET',
				success : function(data) {
					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<tr>';
						html += '<td style="padding-right: 20px;">한줄평 : ' + data[i].rCont + ' </td>';
						html += '<td>작성일 : ' + data[i].rDate + ' </td>';
						html += '</tr>';
					}

					$('#reviewList').html(html);

				}
			});
			
			$.ajax({
				url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie/' + midx,
				type : 'GET',
				success : function(data) {
					var html = '';
					html += '<tr>';
					html += '<td><input type="hidden" id="midx" name="midx" value="'+ data.midx +'"></td>';
					html += '<td><input type="hidden" id="mName" name="mName" value="'+ data.mName +'"></td>';
					html += '<td>한줄평 <input type="text" id="rCont" name="rCont"></td>';
					html += '<td><input type="submit" value="한줄평쓰기"></td>';
					html += '</tr>';
				
				$('#reviewtable').html(html);
				}
			});
			
		}
</script>
</body>
</html>