<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<body class="landing-page landing-page2">
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
<div class="main" style="background-image: url('images/main.png')">
    <div class="cover black" data-color="black"></div>
    <div class="container">
        <h1 class="logo cursive">
            영화를 추가해 보자~
        </h1>
        <div class="content">
            <div class="subscribe">
                <div class="motto">
                	
                	<span>최신개봉 영화 목록 고르기 (10개)</span><br><br>
                	<select id="api" name="api">
                		
                	
                	</select>
                	<input onclick="apibutton()" type="button" value="검색">
                	
                
                <hr>
                    <form id="form" enctype="multipart/form-data">
                    	<table id="reg">
                    	
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
 </div>
 <script>
	
 		$(document).ready(function(){
 			$.ajax({
 				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f2a15704bc55c5e4e93c1f9bd3949e89&targetDt=20190900',
 				type : 'GET',
 				success : function(data) {
 					var html = '';
 					html += '<option selected>영화를 고르시오</option>';
 					//console.log(data);
 					for (var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
 						
 						html += '<option value="'+ data.boxOfficeResult.dailyBoxOfficeList[i].movieCd +'">'+ data.boxOfficeResult.dailyBoxOfficeList[i].movieNm + '</option>';
 						//html += '<td style="padding-right: 20px;">'+ data.boxOfficeResult.dailyBoxOfficeList[i].openDt + '</td>';
 						/* html += '<td style="padding-right: 20px;">'+ data.boxOfficeResult.dailyBoxOfficeList[i].movieCd + '</td>'; */
 						//html += '<td style="padding-right: 20px;" id="mo1"></td>';
 						//html += '<td style="padding-right: 20px;" id="mo2"></td>';
 						/* html += '<td>상세정보</td>'; */
 						//html += '<td style="padding-right: 20px;" id="mo3"></td>';
 						//html += '<td style="padding-right: 20px;" onclick="info('+ data.boxOfficeResult.dailyBoxOfficeList[i].movieCd +')">상세정보더보기</td>'
 						//html += '</tr>';
 						
 						$('#api').html(html);
 					}
 						
 				}
 			});
 			
 		});
 		
 		function apibutton(){
 			
 			var movieCd = $('#api').val();
 			
 			$.ajax({
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f2a15704bc55c5e4e93c1f9bd3949e89&movieCd=' + movieCd,
				type : 'GET',
				success : function(data) {
					html = '';
					//alert(data.movieInfoResult.movieInfo.actors[0].peopleNm);
					html += '<tr>';
					html += '<td>영화코드</td>';
					html += '<td><input type="text" id="midx" name="midx" value="'+ data.movieInfoResult.movieInfo.movieCd +'"></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td>영화제목</td>';
					html += '<td><input type="text" id="mName" name="mName" value="'+ data.movieInfoResult.movieInfo.movieNm +'"></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td>줄거리</td>';
					html += '<td><input type="text" id="mCont" name="mCont"></td>';
					html += '</tr>'
					html += '<tr>';
					html += '<td>감독/배우</td>';
					html += '<td><input type="text" id="mPer" name="mPer" value="'+ data.movieInfoResult.movieInfo.directors[0].peopleNm +'"></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td>개봉일</td>';
					html += '<td><input type="text" id="mDate" name="mDate" placeholder="yyyy-mm-dd" value="'+ data.movieInfoResult.movieInfo.openDt +'"></td>';
					html += '</tr>';
					html += '<td>상영시간</td>';
					html += '<td><input type="text" id="mRunTime" name="mRunTime" value="'+ data.movieInfoResult.movieInfo.showTm +'"></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td>포스터</td>';
					html += '<td><input type="file" id="mPhoto" name="mPhoto"></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2"><input type="submit" value="영화추가"></td>';
					html += '</tr>';
					//html += data.movieInfoResult.movieInfo.showTm ;
					//html2 += data.movieInfoResult.movieInfo.directors[0].peopleNm ;
					//for(var i =0; i <data.movieInfoResult.movieInfo.actors.length; i++){
					//	html3 += data.movieInfoResult.movieInfo.actors[i].peopleNm+',' ;
					//	
					//$('#mo3').html(html3);
					//}
					//
					//$('#mo1').html(html);
					//$('#mo2').html(html2);
					
					$('#reg').html(html);
				}

			});
 			
 		}
 		
 		
 	
 			
 			
 			
 		
 		
 		
		$('#form').submit(function(){
			 // Get form
	      // var form = $('#form')[0];
	 
	        // Create an FormData object 
	        var formData = new FormData();
	        formData.append("midx",$('#midx').val());
	        formData.append("mRunTime",$('#mRunTime').val());
			 formData.append("mName",$('#mName').val());
			formData.append("mCont",$('#mCont').val());
			formData.append("mPer",$('#mPer').val());
			formData.append("mDate",$('#mDate').val());
			formData.append("mPhoto",$('#mPhoto')[0].files[0]);
			
	 		
			
	 		$.ajax({
				url : 'http://ec2-13-209-21-167.ap-northeast-2.compute.amazonaws.com:8080/movie/movie',
				type : 'POST',
				data : formData,
	            processData: false,
	            contentType: false,
				success : function(data) {
					alert('영화등록 완료~^_★');
					location.reload();
				}
				
			});
	 		return false; 		
	 	});
	
 
 	
	
	</script>
</body>

</html>
