<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>MOVIES :: 회원 리스트</title>
<style>
#contents {
	width : 1200px;
	margin : auto;
}
#listtitle {
	margin : 30px 0px ;
		font-family: Arial ;
		font-size: 30px;
}
</style>
</head>
	
<body>
<!-- 헤더 -->
<%@include file="/WEB-INF/views/frame/header.jsp" %>
<!-- 네이게이션 -->
<%@include file="/WEB-INF/views/frame/nav.jsp" %>

<!-- 컨텐트 시작 -->
<div id="contents">
	<h1 id="listtitle">회원 리스트</h1>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">아이디</th>
				<th scope="col">회원이름</th>
				<th scope="col">가입날짜</th>
				<th scope="col">수정하기</th>
				<th scope="col">삭제하기</th>
			</tr>
		</thead>
		<tbody id="adminmemberlist"></tbody>
	</table>
		
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
								<input type="text" class="form-control" id="idx" readonly>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">아이디 : </label>
								<input type="text" class="form-control" id="uid" readonly>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">비밀번호 : </label>
								<input type="text" class="form-control" id="upw" required>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">회원이름 : </label>
								<input type="text" class="form-control" id="uname" required>
							</div>
							<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Aply</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
    
<script>

	$(document).ready(
		
		function() {

			$.ajax({
					url : 'http://13.125.149.225:8080/users/member/list',
					type : 'GET',
					success : function(data) {
						
						var html = '';

						for (var i = 0; i < data.length; i++) {
								html += '<tr>';
								html += '<th scope="row1">'
										+ data[i].idx
										+ '</th>';
								html += '<th scope="row2">'
										+ data[i].uId
										+ '</th>';
								html += '<th scope="row3">'
										+ data[i].uName
										+ '</th>';
								html += '<th scope="row4">'
										+ data[i].regDate
										+ '</th>';
								html += '<th scope="row7"><button type="button" class="btn btn-primary" onclick="edit('
									+ data[i].idx
									+ ')" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat" value="수정하기">수정하기</button></th>';
								html += '<th scope="row8"><button type="button" class="btn btn-danger" onclick="del('

										+ data[i].idx

										+ ')" value="삭제하기">삭제하기</button></th>';

								html += '</tr>';

								$('#adminmemberlist').html(html);
							}
						}
					})
		});
		
	
    function del(idx){
        
        if(confirm('삭제하시겠습니까?')){
           $.ajax({
                url : 'http://13.125.149.225:8080/users/members/'+idx,
                type : 'DELETE',
                success : function(data){
                    if(data=='success'){
                        alert('삭제되었습니다');
                        location.reload();
                    }          
                }
            });
        }
    }
    
    function edit(idx) {

		if(confirm('수정하시겠습니까?')){
			$.ajax({
				url : 'http://13.125.149.225:8080/users/members/'+idx,
				type : 'GET',
				success : function(data) {
					
					$('#idx').val(idx);
	                $('#uid').val(data.uId);
	                $('#uname').val(data.uName);
				}

			});

		}
    }
	
    
    $('#editForm').submit(function(){

		$.ajax({
			url :'http://13.125.149.225:8080/users/members/'+$('#idx').val(),
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
				idx:$('#idx').val(),
				uId:$('#uid').val(),
				uPw:$('#upw').val(),
				uName:$('#uname').val()
			}),
			success : function(data){
				if(data=='success'){
				alert('수정되었습니다.');	
				location.reload();
				}
			}
		});
		
		return false;
    });
		
     
</script>

</body>
</html>