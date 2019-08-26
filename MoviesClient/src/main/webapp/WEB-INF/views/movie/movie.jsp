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
<c:forEach items="${movieInfo}" var="movieInfo">
	${movieInfo.mName}
</c:forEach>
</body>
</html>