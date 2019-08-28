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
            영화추가
        </h1>
        <div class="content">
            <div class="subscribe">
                <div class="motto">
                    <form id="form" enctype="multipart/form-data">
                    	<table>
                    	<tr>
                    		<td>영화제목</td>
                    		<td><input type="text" id="mName" name="mName"></td>
                    	</tr>
                    	<tr>
                    		<td>줄거리</td>
                    		<td><input type="text" id="mCont" name="mCont"></td>
                    	</tr>
                    	<tr>
                    		<td>감독/배우</td>
                    		<td><input type="text" id="mPer" name="mPer"></td>
                    	</tr>
                    	<tr>
                    		<td>개봉일</td>
                    		<td><input type="text" id="mDate" name="mDate" placeholder="yyyy-mm-dd"></td>
                    	</tr>
                    	<tr>
                    		<td>포스터</td>
                    		<td><input type="file" id="mPhoto" name="mPhoto"></td>
                    	</tr>
                    	<tr>
                    		<td colspan="2"><input type="submit" value="영화추가"></td>
                    	</tr>
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
 		});
 			
		$('#form').submit(function(){
			 // Get form
	      // var form = $('#form')[0];
	 
	        // Create an FormData object 
	        var formData = new FormData();
			
			
			 formData.append("mName",$('#mName').val());
			formData.append("mCont",$('#mCont').val());
			formData.append("mPer",$('#mPer').val());
			formData.append("mDate",$('#mDate').val());
			formData.append("mPhoto",$('#mPhoto')[0].files[0]);
			
	 		alert('1  '+formData);
			
	 		$.ajax({
				url : 'http://localhost:8080/movie/movie',
				type : 'POST',
				data : formData,
	            processData: false,
	            contentType: false,
				success : function(data) {
					alert(data);
				}
				
			});
	 		return false; 		
	 	});
	
 
 	
	
	</script>
</body>

</html>
