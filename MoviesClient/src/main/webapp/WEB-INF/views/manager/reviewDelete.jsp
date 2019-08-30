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
	#reviewAllList{
	margin: 0 auto;
	text-align: center;
	font-size: 20px;
	
	}
	#reviewAllList>tr>td{
		border: 1px solid #ddd;
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
	
	a{
		
		text-align: center;
		margin-left: 45%;
	}  

</style>
<title>MOVIES : MANAGER</title>
</head>
<body>
   <div id="logo_wrap">
      <div >
         <h1>한줄평 삭제 페이지</h1>
      </div>
   </div>
   
<div id="form_wrap">
   <form>
      <div class="form-group">
       <table id="ReviewAllList">

						</table>
         
      </div>
      </form>
      </div>
     
    <a id="button" class="btn btn-secondary" href='<c:url value="/" />' role="button">홈으로</a>
<script>
	

	$(document).ready(function() {
						$.ajax({
							url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/review',
							type : 'GET',
							success : function(data) {
								var html = '';
								for (var i = 0; i < data.length; i++) {
									html += '<tr style="padding-right: 20px;">';
									html += '<td style="padding-right: 30px;">영화제목 →</td>';
									html += '<td style="padding-right: 30px;">'+ data[i].mName + '</td>';
									html += '<td style="padding-right: 30px;">내용 →</td>';
									html += '<td style="padding-right: 30px;">'+ data[i].rCont + '</td>';
									html += '<td style="padding-right: 30px;"><input type="button" onclick="reviewd('+ data[i].midx+ ')" value="삭제하기"></td>';
									html += '</tr>';
									
									$('#ReviewAllList').html(html);
										}

									}
								});

					});

	function reviewd(midx) {
		if (confirm('리뷰를 삭제할꺼예요?')) {
			$.ajax({
				url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/review/' + midx,
				type : 'DELETE',
				success : function(data) {
					alert('리뷰삭제~');
					location.reload();
				}

			});
		} else {
			return false;

		}
	}
</script>

</body>
</html>