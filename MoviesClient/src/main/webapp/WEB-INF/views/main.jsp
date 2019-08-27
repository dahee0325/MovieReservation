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
            movies
        </h1>
        <div class="content">
            <div class="subscribe">
                <div class="motto">
                    <img alt="noImg" src="images/movie1.jpg" height="500">
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
 </div>
</body>

</html>
