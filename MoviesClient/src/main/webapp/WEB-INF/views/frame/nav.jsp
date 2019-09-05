<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="<c:url value="/" />" style="font-family: 'Shrikhand', cursive;font-size:50px;">MOVIES</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value="/movie" />">영화</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value="/cinema" />">상영관</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value="/reserve" />">예매</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value="/confirm" />">예매확인</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	 관리자
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<c:url value="/write" />">영화등록</a>
          <a class="dropdown-item" href="<c:url value="/delete" />">영화관리</a>
          <a class="dropdown-item" href="<c:url value="/reviewDelete" />">리뷰관리</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="<c:url value="/cinema/write" />">상영관등록</a>
          <a class="dropdown-item" href="<c:url value="/cinema/list" />">상영관관리</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="<c:url value="/manager/reserve" />">영화일정등록</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<img src="images/page.png" class="card-img-top" alt="...">