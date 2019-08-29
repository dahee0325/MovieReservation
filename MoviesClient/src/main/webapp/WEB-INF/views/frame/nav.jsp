<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-transparent navbar-fixed-top" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar">
      		<li>
                <a href="<c:url value="/" />">
                    	홈
                </a>
            </li>
            <li>
                <a href="<c:url value="/movie" />">
                    	영화
                </a>
            </li>
             <li>
                <a href="<c:url value="/reserve" />">
                    	예매
                </a>
            </li>
             <li>
                <a href="#">
                    	상영관
                </a>
            </li>
            <li>
                <a href="<c:url value="/write" />">
                    	영화추가
                </a>
            </li>
            <li>
                <a href="<c:url value="/delete" />">
                    	영화삭제/수정
                </a>
            </li>
            <li>
                <a href="<c:url value="/reviewDelete" />">
                    	한줄평삭제
                </a>
            </li>
            
       </ul>

		<ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#">
                    	로그인
                </a>
            </li>
       </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>