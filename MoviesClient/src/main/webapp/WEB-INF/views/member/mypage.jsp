<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
div.mypage_box {
	width: 450px;
}

img {
	display: block;
	width: 100px;
}

#contents {
	width: 900px
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 네이게이션 -->
	<%@include file="/WEB-INF/views/frame/nav.jsp"%>

	<!-- 컨텐트 시작 -->
	<div id="contents">

		<h1>MyPage</h1>
		<div id="myInfo"></div>

	</div>


	<script>
$(document).ready(

function (){
    
	$.ajax({
		url : 'http://13.125.149.225:8080/users/members/' +idx,
		type : 'GET',
		success : function(data){
			alert(JSON.stringify(data));
            
            var html = '';
            
            for(var i=0; i<data.length;i++){
                html += '<div class="card">\n';
                html += 'idx : ' + data[i].idx +' <br>\n';
                html += 'uId : ' + data[i].uId +' <br>\n';
                html += 'uName : ' + data[i].uName +' <br>\n';
                html += 'uPhoto : ' + data[i].uPhoto +'<br>\n';
                html += '<button onclick="del('+ data[i].idx +')">삭제하기</button><br>\n';
                html += '<button onclick="editPreSet('+ data[i].idx +')">수정하기</button><br>\n';
                html += '</div>\n';
            }
            
            $('#myInfo').html(html);
		}
		
	});
	
});
	
	
	
</script>
</body>
</html>