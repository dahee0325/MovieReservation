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
	input[type=text]{
	height: 60px;
		width: 300px;
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
						<h5 class="modal-title" id="exampleModalLongTitle">영화 수정 하기</h5>
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
			<div id="oo">
			
			</div>
			<hr>
		</div>
		
		<br><hr>
		
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
								
								html += '<img src="http://localhost:8080/movie/uploadfile/' + data[i].mPhoto+ '"><br>';
								html += '<span>' + data[i].mName + ' </span><br>';
								html += '<span onclick="movie('+ data[i].midx + ')">★삭제</span>';
								html += '<span onclick="edit('+ data[i].midx +')">☆수정</span>';
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
		
		function edit(midx) {
			if(confirm('선택한 영화를 수정할꺼예요?')){
				
				$.ajax({
					url : 'http://localhost:8080/movie/movie/' + midx,
					type : 'GET',
					success : function(data) {
						$('div.modal').modal();
						var html = '';
						html += '<form id="movieedit" enctype="multipart/form-data">';
						html += '<table id="moviedeitt">';
							
						
						html += '<tr>';
						html += '<td><input type="hidden" id="midx" name="midx" value="'+data.midx+'"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td>영화제목<input type="text" id="mName" name="mName" placeholder="'+data.mName+'" value="'+data.mName+'"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td>줄거리<input type="text" id="mCont" name="mCont" value="'+data.mCont+'"></td>';
						html += '</tr>'
						html += '<tr>';
						html += '<td>감독/배우<input type="text" id="mPer" name="mPer" placeholder="'+data.mPer+'" value="'+data.mPer+'"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td>개봉일<input type="text" id="mDate" name="mDate" placeholder="yyyy-mm-dd" value="'+data.mDate+'"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td>상영시간<input type="text" id="mRunTime" name="mRunTime" placeholder="'+data.mRunTime+'" value="'+data.mRunTime+'"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td>포스터<input type="file" id="mPhoto" name="mPhoto"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td><input type="button" onclick="bo()" value="영화수정"></td>';
						html += '</tr>';
						
						html += '</table>'
						html += '</form>';

						$('#oo').html(html);
					}
				
				});
			}else{
				return false;
				
			}
			
		}
		
		function bo(){
			var formData = new FormData();
	        /* formData.append("midx",$('#midx').val());  */
	        formData.append("mRunTime",$('#mRunTime').val());
			formData.append("mName",$('#mName').val());
			formData.append("mCont",$('#mCont').val());
			formData.append("mPer",$('#mPer').val());
			formData.append("mDate",$('#mDate').val());
			formData.append("mPhoto",$('#mPhoto')[0].files[0]); 
			
			
		
			
			//alert(formData);
			
			$.ajax({
				
				url : 'http://localhost:8080/movie/movie/'+ $('#midx').val(),
				type : 'POST',
				data : formData,
	            processData: false,
	            contentType: false,
				success : function(data) {
					alert('수정완료~');
					location.reload();
				}
			
			});
			
		
			
			return false; 
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
