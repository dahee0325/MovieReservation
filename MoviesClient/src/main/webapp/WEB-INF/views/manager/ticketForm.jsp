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
   <form>
      <div class="form-group">
         <label for="cidx">극장을 선택하세요.</label>
         <select id="cidx" name="cidx" class="custom-select custom-select-lg mb-3">
           <option selected>극장을 선택하세요.</option>
           <option value="1">One</option>
           <option value="2">Two</option>
           <option value="3">Three</option>
      </select>
      </div>
      <div class="form-group">
         <label for="midx">영화를 선택하세요.</label>
         <select id="midx" name="midx" class="custom-select custom-select-lg mb-3">

      </select>
      </div>
      <div class="form-group">
         <label for="tDate">상영할 날짜를 입력하세요.</label>
         <input type="text" class="form-control" id="tDate" placeholder="숫자만 입력해주세요. ex) 1" name="tDate">
      </div>
      <div class="form-group">
         <label for="tTime">상영시작할 시간을 입력하세요.</label> <input
            type="text" class="form-control" id="tTime" placeholder="초를 빼고 입력해주세요. ex)11:00" name="tTime">
      </div>
      <div class="form-group">
         <label for="mRunTime">러닝타임</label>
         <input type="text" class="form-control" id="mRunTime" name="mRunTime">
      </div>
      <div class="form-group">
         <label for="cSeatCnt">좌석개수</label>
         <input type="text" class="form-control" id="cSeatCnt" name="cSeatCnt">
      </div>
      <a id="button" class="btn btn-secondary" href='<c:url value="/" />' role="button">홈으로</a>
      <div style="text-align: right;">
         <button type="submit" class="btn btn-primary mb-2">등록하기</button>
         <button class="btn btn-primary mb-2">취소하기</button>
      </div>
   </form>
</div>
   <script>

      
   </script>



</body>
</html>