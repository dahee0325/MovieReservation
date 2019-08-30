<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="<c:url value="/" />"
		style="font-family: 'Shrikhand', cursive; font-size: 50px;">MOVIES</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/reserve" />">예매</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/cinema" />">상영관</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/cinema/write" />">등록</a></li>

			<li class="nav-item" style="margin-left:1200px;"><a class="nav-link" href="<c:url value='/regist' />" id="memberregist">회원가입</a></li>
			<%-- <li class="nav-item"><a class="nav-link" href="<c:url value='/mypage' />" id="mypage" style="display: none">내 정보</a></li> --%>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/list' />" id="memberlist" style="display: none">회원 리스트</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/login' />" id="login">로그인</a></li>
			<li class="nav-item"><a onclick="logout()" class="nav-link"  id="logout" style="display: none">로그아웃</a></li>
			
			
			 <%-- <li class="nav-item dropdown" style="margin-left:1000px;">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          MOVIES에 오신걸 환영합니다!
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item"><a class="nav-link" href="<c:url value='/login' />" id="login">로그인</a>
          <a class="dropdown-item"><a class="nav-link" href="<c:url value='/regist' />" id="memberregist">회원가입</a>
          <a class="dropdown-item"><a class="nav-link" href="<c:url value='/mypage' />" id="mypage" style="display: none">내 정보</a>
          <a class="dropdown-item"><a class="nav-link" href="<c:url value='/list' />" id="memberlist" style="display: none">회원 리스트</a>
          <a class="dropdown-item"><a onclick="logout()" class="nav-link"  id="logout" style="display: none">로그아웃</a></li>
        </div>
      </li> --%>
		</ul>
	</div>
</nav>
<img src="images/page.png" class="card-img-top" alt="...">
