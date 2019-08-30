<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp" %>
<title>Insert title here</title>
<style>
	#main_wrap {
		width: 500px;
		margin: 0 auto;
		border: 1px solid #DDD;
	}
	#reserve_wrap {
		padding: 20px;
	}
	
	#delBtn {
		margin-top: 20px;
		display: block;
		text-align: center;
		padding: 10px;
		border: 1px solid #DDD;
	}
	
	#delBtn:hover {
		background-color: #DDD;
		color: white;
		cursor: pointer;
	}
	
	#main_wrap p {
		text-align: center;
		padding: 50px 0;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/frame/nav.jsp" %>
<h2 style="text-align: center;font-family: 'East Sea Dokdo', cursive;font-size:45px;">예매확인</h2>
	<div id="main_wrap">
	
	</div>
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<script>

		$(document).ready(function() {
			
			reservelist();
			
		});
		
		
		function reservelist() {

			$.ajax({
				url : 'http://13.209.47.16:8080/reserve/reserveInfo/22',
				type : 'GET',
				success : function(data) {
					
					var html = '';
					
					if(data.length>0) {
						for (var i = 0; i < data.length; i++) {
							html += '<div id="reserve_wrap">\n';
							html += '<div>'+data[i].idx+'님 8월 '+data[i].tDate+'일 '+data[i].tTime+'~'+data[i].totalTime+'</div>\n';
							html += '<div>'+data[i].midx+'영화 '+data[i].cidx+'상영관 '+data[i].sidx+'번 자리</div>\n예매되었습니다.';
							html += '<a id="delBtn" onclick="reserveDel('+data[i].ridx+')">예매취소</a>'
							html += '</div>\n';
						}

					}else {
						html +='<p>예매내역이 없습니다.</p>'
					}
					
					
					$('#main_wrap').html(html);
					
				}

			});

		}
		
		function reserveDel(ridx) {
						
			if(confirm('예매를 취소하겠습니까?')){
				
				$.ajax({
					url : 'http://13.209.47.16:8080/reserve/reserveDel/'+ridx,
					type : 'DELETE',
					success : function(data) {
						
						if(data > 0) {
							alert('예매취소되었습니다.')
							location.reload();
						}else {
							alert('예매취소불가능')
						}
						
					}

				});
			}
			
			
		}
		
	</script>
</body>
</html>
