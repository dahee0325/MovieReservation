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
<title>Insert title here</title>
</head>
<body>

   <div class="jumbotron jumbotron-fluid">
      <div class="container">
         <h1 class="display-4">상영관 정보를 등록합니다.</h1>
         <p class="lead">This is a modified jumbotron that occupies the
            entire horizontal space of its parent.</p>
      </div>
   </div>
   <form id="Regform">
      <div class="form-group">
         <label for="formGroupExampleInput">극장을 입력하세요.</label> <input
            type="text" class="form-control" id="formGroupExampleInput"
            placeholder="MOVIES 강남점  / MOVIES 목동점  /  MOVIES 구로점   " name="cName">
      </div>
      <div class="form-group">
         <label for="formGroupExampleInput">극장의 위치를 입력하세요.</label> <input
            type="text" class="form-control" id="formGroupExampleInput"
            placeholder="강남점 - 서울특별시 강남구  / 목동점  - 서울특별시 양천구  / 구로점  - 서울특별시 구로구 " name="cRot">
      </div>
      <div class="form-group">
         <label for="formGroupExampleInput">극장소개를  해주세요.</label> <input
            type="text" class="form-control" id="formGroupExampleInput"
            placeholder="극장소개를 해주세요." name="cCont">
      </div>
      <div class="form-group">
         <label for="formGroupExampleInput">좌석을 입력해주세요.</label> <input
            type="text" class="form-control" id="formGroupExampleInput"
            placeholder="좌석을 입력해주세요." name="cSeatCnt">
      </div>
      <a id="button" class="btn btn-secondary" href='<c:url value="/" />' role="button">홈으로</a>
      <div style="text-align: right;">
         <button type="submit" class="btn btn-primary mb-2">등록하기</button>
         <button class="btn btn-primary mb-2">취소하기</button>
      </div>
   </form>


   <script>
      $(document).ready(function() {

         $('#Regform').submit(function() {
            
            $.ajax({
               url : 'http://54.180.145.4:8080/project/cinema',
               type : 'POST',
               data : $('#Regform').serialize(),
               success : function(data) {
                  alert('등록하였습니다.');
               }
            });

            return false;
         });
         

      });
      

      
   </script>



</body>
</html>