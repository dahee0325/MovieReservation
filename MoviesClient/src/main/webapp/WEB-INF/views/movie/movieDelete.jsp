<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<style>
	.movie{
			float: left;
			margin-right: 50px;
			width: 23%;
			font-size: 20px;
			
	}
	img{
		width: 300px;
		height: 300px;
		
	}
	#review{
		margin: 0 auto;
	}
	#reviewList{
		margin: 0 auto;
		text-align: center;
		font-size: 20px;
		font-weight: bold;
		color: black;
		
	}
	
	#reviewListHeader{
		font-size: 30px;
		font-weight: bold;
		color: black;
		text-align: center;
	}
	#reviewtable{
		margin: 0 auto;
		font-size: 15px;
		font-weight: bold;
		color: black;
	}
</style>
<body class="landing-page landing-page2">
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<div class="main" style="background-image: url('images/main.png')">
		<div class="cover black" data-color="black"></div>
		<div class="container">
			<h1 class="logo cursive">영화를 삭제해보자~</h1>
			<div class="content">
				<div class="subscribe">
					<div class="motto">
						<div id="MovieList">

						</div>
					</div>
				</div>
			</div>
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
		<br><hr>
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
	</div>
	<script>
		$(document).ready(
				function() {

					$.ajax({
						url : 'http://localhost:8080/movie/movie',
						type : 'GET',
						success : function(data) {
							var html = '';

							for (var i = 0; i < data.length; i++) {
								html += '<div class="movie">\n';
								
								html += '<img onclick="movie('+ data[i].midx + ')" src="http://localhost:8080/movie/uploadfile/' + data[i].mPhoto+ '"><br>';
								html += '<span>' + data[i].mName + ' </span>';
								html += '</div>\n';
							}

							$('#MovieList').html(html);

						}
					});
					
					
					
					
				});
		
		
		
		function movie(midx) {
			if(confirm('선택한 영화를 삭제할꺼예요?')){
				$.ajax({
					url : 'http://localhost:8080/movie/movie/' + midx,
					type : 'DELETE',
					success : function(data) {
						alert('선택한 영화 삭제완료~^_★');
						location.reload();
					}

				});
			}else{
				return false;
				
			}
		
		}

		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-46172202-1', 'auto');
		ga('send', 'pageview');
	</script>
</body>

</html>
