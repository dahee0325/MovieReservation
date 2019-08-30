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
</style>
<title>MOVIES : MANAGER</title>
</head>
<body>
   <div id="logo_wrap">
      <div >
         <h1>영화 일정 정보 등록</h1>
      </div>
   </div>
   
<div id="form_wrap">
   <form id="ticketForm">
      <div class="form-group">
         <label for="cidx">극장을 선택하세요.</label>
         <select id="cidx" name="cidx" class="custom-select custom-select-lg mb-3">

		</select>
      </div>
      <div class="form-group">
         <label for="midx">영화를 선택하세요.</label>
         <select id="midx" name="midx" class="custom-select custom-select-lg mb-3">

		</select>
      </div>
      <div class="form-group">
         <label for="tDate">상영할 일자를 입력하세요. (최근 일주일 내)</label>
         <input type="text" class="form-control" id="tDate" placeholder="숫자만 입력해주세요. ex) 1" name="tDate" maxlength="2">
      </div>
      <div class="form-group">
         <label for="tTime">상영시작할 시간을 입력하세요.</label> <input
            type="text" class="form-control" id="tTime" placeholder="초를 빼고 입력해주세요. ex)11:00" name="tTime" maxlength="5">
      </div>
      <div class="form-group">
         <label for="cSeatCnt">좌석개수</label>
         <input type="text" class="form-control" id="cSeatCnt" name="cSeatCnt" placeholder="단위 : 개">
      </div>
      <div class="form-group">
         <label for="mRunTime">러닝타임</label>
         <input type="text" class="form-control" id="mRunTime" name="mRunTime" placeholder="단위 : 분">
      </div>
      <div style="text-align: right;">
         <button style="margin-top: 9px;" type="submit" class="btn btn-primary mb-2">등록하기</button>
         <a id="button" class="btn btn-secondary" href='<c:url value="/" />' role="button">홈으로</a>
      </div>
   </form>
</div>
   <script>
      $(document).ready(function() {
    	  
    	  cinemaList();
    	  movieList();
    	  
    	  $('#cidx').change(function () {

			$.ajax({
	  			url : 'http://13.209.47.16:8080/reserve/manager/cinemaList/'+$(this).val(),
	  			type : 'GET',
	  			contentType : 'application/json; charset=utf-8',
	  			dataType : 'json',
	  			success : function(data) {
	  				
	  				$('#cSeatCnt').val(data);
	  				
	  				}
	  			});
			});
    	  
    	  $('#midx').change(function () {

  			$.ajax({
  	  			url : 'http://13.209.47.16:8080/reserve/manager/movieList/'+$(this).val(),
  	  			type : 'GET',
  	  			contentType : 'application/json; charset=utf-8',
  	  			dataType : 'json',
  	  			success : function(data) {
  	  				
  	  				$('#mRunTime').val(data);
  	  				
  	  				}
  	  			});
  			});
    	  
         
      });
      
      function cinemaList() {
    	  
    	  $.ajax({
  			url : 'http://13.209.47.16:8080/reserve/manager/cinemaList',
  			type : 'GET',
  			contentType : 'application/json; charset=utf-8',
  			dataType : 'json',
  			success : function(data) {
  				var html = '';
				html += '<option selected>영화관을 선택하세요.</option>';
				for (var i = 0; i < data.length; i++) {
					
					html += '<option value="'+ data[i].cidx +'">'+ data[i].cName + '</option>';

					
					$('#cidx').html(html);
				}
  			}
  		});
    	  
      }
      
	function movieList() {
    	  
    	  $.ajax({
  			url : 'http://13.209.47.16:8080/reserve/manager/movieList',
  			type : 'GET',
  			contentType : 'application/json; charset=utf-8',
  			dataType : 'json',
  			success : function(data) {
  				var html = '';
				html += '<option selected>영화를 선택하세요.</option>';
				for (var i = 0; i < data.length; i++) {
					
					html += '<option value="'+ data[i].midx +'">'+ data[i].mName + '</option>';

					
					$('#midx').html(html);
				}
  			}
  		});
    	  
      }
	
	
	$('#ticketForm').submit(function() {
		
		if ($('#tDate').val() == '') {
			alert('상영날짜를 선택해주세요.');
		}else if($('#tTime').val() == ''){
			alert('상영시간을 선택해주세요.');
		}
		
		$.ajax({
			url : 'http://13.209.47.16:8080/reserve/manager/movies',
			type : 'POST',
			data : $('#ticketForm').serialize(),
			success : function(data) {
				if (data > 0) {
					alert('등록되었습니다.');
					location.reload();
				}
			}
		});
		return false;
	});
   </script>



</body>
</html>