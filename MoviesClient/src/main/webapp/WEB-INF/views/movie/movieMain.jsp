<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVIES : Movie</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<h1>영화 목록</h1>
<div id="MovieList">

</div>


<hr>
<h2>한줄평</h2>
<div>
	룰루랄라
</div>
<script>
		$(document).ready(function(){
		
		$.ajax({
            url : 'http://localhost:8080/movie/movie',
            type : 'GET',
            success : function(data){
            	var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div class="movie">\n';
					html += 'mName : ' + data[i].mName + ' <br>\n';
					html += 'mCont : ' + data[i].mCont + ' <br>\n';
					html += 'mPer : ' + data[i].mPer + ' <br>\n';
					html += 'mDate : ' + data[i].mDate + '<br>\n';
					html += 'uPhoto : ' + data[i].mPhoto + '<br>\n';
					html += '</div>\n';
				}

				$('#MovieList').html(html);
            	
            	
            }
        });
		
	});
        
            
         
		

	
</script>
</body>
</html>