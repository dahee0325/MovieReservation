<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
   #logo_wrap {
      width: 100%;
      background-color: #EAEAEA;
      text-align: center;
      height: 200px;
      margin-bottom: 30px;
      line-height: 200px;
   }
   
   #logo_wrap h1 {
      line-height: 200px;
   }
   
   #form_wrap{
      width: 800px;
      margin: auto;
   }
   .movie span{
   	margin-top : 20px;
   	cursor: pointer;
   }
	.movie{
			float: left;
			margin-right: 150px;
			width: 23%;
			font-size: 20px;
			text-align: center;
			
			margin-bottom: 20px;
			
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
		margin: 0 auto;
		margin-left: 50px;
	}
	#reviewtable{
		margin: 0 auto;
		font-size: 15px;
		font-weight: bold;
		color: black;
	}
	input[type=text]{
	height: 60px;
		width: 450px;
	}
	
	#moviedeitt{
		text-align: center;
		margin: 0 auto;
		margin-left: 50px;
	}
	
	
</style>
<title>MOVIES : MANAGER</title>
</head>
<body>
   <div id="logo_wrap">
      <div >
         <h1>영화 수정 삭제 페이지</h1>
      </div>
   </div>
   
<div id="form_wrap">
   <form>
      <div class="form-group">
         <div id="MovieList">

						</div>
         
      </div>
      
      <!-- Modal -->
		<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-lg">
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
						
					</div>
				</div>
			</div>
		</div>
      
   </form>
   <a id="button" class="btn btn-secondary" href='<c:url value="/" />' role="button">홈으로</a>

</div>
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
						
						html += '<img src="http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/uploadfile/' + data[i].mPhoto+ '"><br><br>';
						html += '<div>' + data[i].mName + ' </div>';
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
			url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie/' + midx,
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
			url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie/' + midx,
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
				html += '<td>영화제목</td><td><input type="text" id="mName" name="mName" placeholder="'+data.mName+'" value="'+data.mName+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<td>줄거리</td><td><input type="text" id="mCont" name="mCont" value="'+data.mCont+'"></td>';
				html += '</tr>'
				html += '<tr>';
				html += '<td>감독/배우</td><td><input type="text" id="mPer" name="mPer" placeholder="'+data.mPer+'" value="'+data.mPer+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<td>개봉일</td><td><input type="text" id="mDate" name="mDate" placeholder="yyyy-mm-dd" value="'+data.mDate+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<td>상영시간</td><td><input type="text" id="mRunTime" name="mRunTime" placeholder="'+data.mRunTime+'" value="'+data.mRunTime+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<td>포스터</td><td><input type="file" id="mPhoto" name="mPhoto"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<td colspan="2"><input type="button" onclick="bo()" value="영화수정"></td>';
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
		
		url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie/'+ $('#midx').val(),
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
	</script>

</body>
</html>