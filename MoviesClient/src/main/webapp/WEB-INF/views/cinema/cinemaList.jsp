<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
         <h1 class="display-4">상영관 정보 관리페이지입니다.</h1>
         <p class="lead">This is a modified jumbotron that occupies the
            entire horizontal space of its parent.</p>
      </div>
   </div>

   <table class="table">
      <thead>
         <tr>
            <th scope="col">#</th>
            <th scope="col">극장이름</th>
            <th scope="col">극장위치</th>
            <th scope="col">극장소개</th>
            <th scope="col">좌석개수</th>
            <th scope="col">수정하기</th>
            <th scope="col">삭제하기</th>
         </tr>
      </thead>
      <tbody id="TheaterAllList">
      </tbody>
   </table>
      <a href="<c:url value="/" />" style="margin-left:700px;font-size:30px;">메인페이지로 이동하고 싶어요 !</a>
      <br><br>
      
      
      
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form id="editForm">
                     <div class="form-group">
                        <label for="recipient-name" class="col-form-label">idx : </label>
                        <input type="text" class="form-control" id="idx">
                     </div>
                     <div class="form-group">
                        <label for="recipient-name" class="col-form-label">극장이름 : </label>
                        <input type="text" class="form-control" id="cname">
                     </div>
                     <div class="form-group">
                        <label for="recipient-name" class="col-form-label">극장위치 : </label>
                        <input type="text" class="form-control" id="crot">
                     </div>
                     <div class="form-group">
                        <label for="recipient-name" class="col-form-label">극장소개 : </label>
                        <input type="text" class="form-control" id="ccont">
                     </div>
                     <div class="form-group">
                        <label for="recipient-name" class="col-form-label">좌석개수 : </label>
                        <input type="text" class="form-control" id="cseatCnt">
                     </div>
                     <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Send
                     message</button>
                  </div>
                  </form>
               </div>
               
            </div>
         </div>
      </div>



      <script>
         $(document).ready(
                     function() {
                        $.ajax({
                                 url : 'http://54.180.145.4:8080/project/cinema/cinemaAllList',
                                 type : 'GET',
                                 success : function(data) {
                                    var html = '';
                                    for (var i = 0; i < data.length; i++) {
                                       html += '<tr>';
                                       html += '<th scope="row1">'
                                             + data[i].cidx
                                             + '</th>';
                                       html += '<th scope="row2">'
                                             + data[i].cName
                                             + '</th>';
                                       html += '<th scope="row3">'
                                             + data[i].cRot
                                             + '</th>';
                                       html += '<th scope="row4">'
                                             + data[i].cCont
                                             + '</th>';
                                       ;
                                       html += '<th scope="row5">'
                                             + data[i].cSeatCnt
                                             + '</th>';
                                       html += '<th scope="row6"><button type="button" class="btn btn-primary" onclick="edit1('
                                          + data[i].cidx
                                          + ')" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat" value="수정하기">수정하기</button></th>';
                                       html += '<th scope="row7"><button type="button" class="btn btn-danger" onclick="delete1('
                                             + data[i].cidx
                                             + ')" value="삭제하기">삭제하기</button></th>';
                                       html += '</tr>';
                                       $('#TheaterAllList').html(html);
                                    }
                           
                                 }

                              })
                     });
         
         
         function edit1(cidx) {
            if(confirm('수정하시겠습니까?')){
               $.ajax({
                  url : 'http://54.180.145.4:8080/project/cinema/cinemaList/theaters/'+cidx,
                  type : 'GET',
                  
                  success : function(data) {
                     $('#idx').val(data.cidx);
                     $('#cname').val(data.cName);
                     $('#crot').val(data.cRot);
                     $('#ccont').val(data.cCont);
                     $('#cseatCnt').val(data.cSeatCnt);

                  }
               });
            }
         }
         
         
         $('#editForm').submit(function(){
               $.ajax({
                  url :'http://54.180.145.4:8080/project/cinema/cinemaList/theater/'+$('#idx').val(),
                   dataType: 'text',
                    type: 'PUT',   
                    contentType:'application/json;chartset=utf-8',
                    data: JSON.stringify({
                     cidx:$('#idx').val(),
                     cName:$('#cname').val(),
                     cRot:$('#crot').val(),
                     cCont:$('#ccont').val(),
                     cSeatCnt:$('#cseatCnt').val(),
                  }),
                  success : function(data) {
                     if(data=='success'){
                     alert('수정되었습니다.');   
                     location.reload();
                     }
                  }
               });
            
               return false;
         
      });
         
         
         
         function delete1(cidx) {
            if(confirm('정말 삭제하시겠습니까?')){
               $.ajax({
                  url : 'http://54.180.145.4:8080/project/cinema/cinemaList/cinema/'+cidx,
                  type : 'DELETE',
                  success : function(data) {
                     alert('삭제가 완료되었습니다.');
                     location.reload();
                  }
               });
            }else{
               return false;
               
            }
         }
      
      </script>
</body>
</html>