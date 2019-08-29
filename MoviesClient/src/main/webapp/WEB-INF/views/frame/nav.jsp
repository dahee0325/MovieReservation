<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="<c:url value="/" />" style="font-family: 'Shrikhand', cursive;font-size:50px;">MOVIES</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">영화</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/reserve" />">예매</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/cinema" />">상영관</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/cinema/write" />">등록</a>
      </li>
    </ul>
  </div>
</nav>
<img src="images/page.png" class="card-img-top" alt="...">