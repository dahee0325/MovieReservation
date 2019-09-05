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
<div id="di">

</div>
<script>
$(document).ready(
				function() {

					$.ajax({
						url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=430156241533f1d058c603178cc3ca0e',
						type : 'GET',
						success : function(data) {
							var html = '';
							for(var i = 0; i < data.length; i++){
								html += '<div>';
								html += '영화제목 : '+ data.movieNm ;
								html += '</div>';
								
							}
							

							$('#di').html(html);

						}
					});

				});
				
</script>

</body>
</html>