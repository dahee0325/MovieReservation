<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/frame/nav.jsp" %>
<h2 style="text-align: center;font-family: 'East Sea Dokdo', cursive;font-size:45px;">CINEMA</h2>
   <h2><img src="http://img.cgv.co.kr/R2014/images/title/h2_theater.png" alt="THEATER" /></h2>
   <div class="card-deck">
     <div class="card">
       <img src="images/gangnam.png" class="card-img-top" alt="...">
       <div class="card-body">
         <h5 class="card-title">MOVIES 강남점</h5>
         <p class="card-text">서울특별시 강남구 역삼동 814-6 스타플렉스
         서울특별시 강남구 강남대로 438 (역삼동)</p>
         <p class="card-text"><small class="text-muted">1544-1122
               20석</small></p>
       </div>
     </div>
     <div class="card">
       <img src="images/sinlim.png" class="card-img-top" alt="...">
       <div class="card-body">
         <h5 class="card-title">MOVIES 목동점</h5>
         <p class="card-text">서울특별시 양천구 목동 916번지 현대백화점 지하2층
         서울특별시 양천구 목동로 257, 지하2층(목동)</p>
         <p class="card-text"><small class="text-muted">1544-1122
         20석</small></p>
       </div>
     </div>
     <div class="card">
       <img src="images/guro.png" class="card-img-top" alt="...">
       <div class="card-body">
         <h5 class="card-title">MOVIES 구로점</h5>
         <p class="card-text">서울특별시 구로구 구로5동 573번지 AK플라자(구 애경백화점) 5층
         서울특별시 구로구 구로중앙로 152 (구로동)</p>
         <p class="card-text"><small class="text-muted">1544-1122
         20석</small></p>
       </div>
     </div>
   </div>
   
   

   <br><br>
   <h4 style="margin-left:10px">언제 영화를 보시나요?</h4>
   <div id="dataselect">
   <!-- <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_2();">27</a> |
   <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_2();">28</a> |
   <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_2();">29</a> |
   <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_2();">30</a> |
   <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_2();">31</a> |  -->
   </div>
   
   <br><br>
   <h4 style="margin-left:10px">자주가는 극장을 선택하세요!</h4>
   <div id="theaterselect">
   <!-- <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_1();">MOVIES 강남점</a> |
   <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_1();">MOVIES 목동점</a> |
   <a id="button" class="btn btn-Dark" href="" role="button" onclick="button_1();">MOVIES 구로점</a> | -->
   </div>
   

   
   <br><br>
   <table class="table table-hover">
        <thead id="cinemaForm">
             <tr>
                <th scope="col">극장이름</th>
                <th scope="col">극장위치</th>
             <th scope="col">영화제목</th>
                <th scope="col">상영날짜</th>
              <th scope="col">상영시간</th>
             </tr>
        </thead>
    
 
    <tbody id="cinemaidx">
    </tbody>
    
    </table>      
          <div style="text-align:center;">
          <button type="button" class="btn btn-primary btn-lg">예매하러 갈게요 :></button>
   <button type="button" class="btn btn-secondary btn-lg">다음에 올게요!</button>
   </div>
      

   
   <script>
   $(document).ready(function(){
      
      $.ajax({
         url : 'http://localhost:8080/project/cinema' ,
         type : 'GET',
         success : function(data) {
            var html = '';
            
            for(var i=0; i <data.length; i++){
               html += '<span id="button" style="cursor: pointer" class="btn btn-Dark" href="" role="button" onclick="button_2(\''+data[i].cName+'\');">'+data[i].cName +'</span> |';
            }
            $('#theaterselect').html(html);
         }
        }); 
      
      
      $.ajax({
         url : 'http://localhost:8080/project/cinema' ,
         type : 'GET',
         success : function(data) {
            var html = '';
            
            for(var i=0; i <data.length; i++){
               html += '<span id="button" style="cursor: pointer" class="btn btn-Dark" href="" role="button" onclick="button_1(\''+ data[i].cDate +'\');">'+ data[i].cDate +'</span>  |';
               
               $('#dataselect').html(html);
            }
            /* alert(data); */
         }
        });
   
      
    });
    

   function button_1(cDate) {
      
      $.ajax({
      url : 'http://localhost:8080/project/cinema/cinemaList/' + cDate ,
      type : 'GET',
      success : function(data) {
         
         var html = '';   
         for(var i=0; i<data.length; i++){
            html += '<tr>';
            html += '<td>'+data[i].cName+'</td>';
            html += '<td>'+data[i].cRot+'</td>';
            html += '<td>'+data[i].mName+'</td>';
            html += '<td>'+data[i].cDate+'</td>';
            html += '<td>'+data[i].cTime+'</td>';
            html += '</tr>';
            
            $('#cinemaidx').html(html);
         }
            
      }
     })
   }
   
   function button_2(cName) {
      
      $.ajax({
      url : 'http://localhost:8080/project/cinema/cinemaList/'+cName ,
      type : 'GET',
      success : function(data) {
         
         var html = '';   
            html += '<tr>';
            html += '<td>'+data.cName+'</td>';
            html += '<td>'+data.cRot+'</td>';
            html += '</tr>';
            $('#cinemaidx').html(html);
      }
     })
   }
   
   
   /* function button_2(cName) {
      
      $.ajax({
      url : 'http://localhost:8080/project/cinema/'+cName ,
      type : 'GET',
      success : function(data) {
         
         var html = '';   
            html += '<tr>';
            html += '<td>'+data.cName+'</td>';
            html += '<td>'+data.cRot+'</td>';
            html += '</tr>';
            $('#cinemaidx').html(html);
      }
     })
   } */
   
   </script>
   
</body>
</html>