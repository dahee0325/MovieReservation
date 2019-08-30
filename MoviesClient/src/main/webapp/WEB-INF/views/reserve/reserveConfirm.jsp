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
        <h2 class="logo cursive" style="font-size: 30px;">
            	예매확인
        </h2>
        <div class="content">
            <div class="subscribe">
                <div class="motto">
						<div id="con_wrap">
							
						</div>
					</div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
 </div>
	<script>

		$(document).ready(function() {
			
			reservelist();
			
		});
		
		
		function cinemalist() {

			$.ajax({
				url : 'http://localhost:8080/reserve/cinemaList',
				type : 'GET',
				success : function(data) {

					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div id="cinemaList">\n';
						html += '<a onclick="cinemaClick(' + data[i].cidx+ ')">' + data[i].cidx + '</a> <br>\n';
						html += '</div>\n';
					}
					
					$('#cinemaList_wrap').html(html);
				}

			});

		}
		
		
	</script>
</body>
</html>
