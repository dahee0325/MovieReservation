<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="images/favicon.png">

    <title>MOVIES</title>

	<!-- Canonical SEO -->
    <link rel="canonical" href="https://www.creative-tim.com/product/coming-sssoon-page"/>

    <meta name="keywords" content="coming soon page, under construction page, bootstrap page, free bootstrap page, creative tim, not ready page, demo page">
    <meta name="description" content="Free one page item based on Bootstrap 3. Use Coming Sssoon Page to create a following group users before actually starting your project! ">

    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="Coming Sssoon Page by Creative Tim">
    <meta itemprop="description" content="Free one page item based on Bootstrap 3. Use Coming Sssoon Page to create a following group users before actually starting your project! ">
    <meta itemprop="image" content="https://s3.amazonaws.com/creativetim_bucket/products/20/coming_sssoon_thumbnail.png">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@creativetim">
    <meta name="twitter:title" content="Coming Sssoon Page by Creative Tim">
    <meta name="twitter:description" content="Free one page item based on Bootstrap 3. Use Coming Sssoon Page to create a following group users before actually starting your project! ">
    <meta name="twitter:creator" content="@creativetim">
    <meta name="twitter:image" content="https://s3.amazonaws.com/creativetim_bucket/products/20/coming_sssoon_thumbnail.png">

    <!-- Open Graph data -->
    <meta property="og:title" content="Coming Sssoon Page by Creative Tim" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="https://demos.creative-tim.com/coming-sssoon-demo-image-background" />
    <meta property="og:image" content="https://s3.amazonaws.com/creativetim_bucket/products/20/coming_sssoon_thumbnail.png" />
    <meta property="og:description" content="Free one page item based on Bootstrap 3. Use Coming Sssoon Page to create a following group users before actually starting your project! " />
    <meta property="og:site_name" content="Creative Tim" />


    <link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/coming-sssoon.css" rel="stylesheet" />

    <!--     Fonts     -->
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>

		<!-- Google Tag Manager -->
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-NKDMSK6');</script>
		<!-- End Google Tag Manager -->
		</head>

		<body class="landing-page landing-page2">
			<!-- Google Tag Manager (noscript) -->
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<!-- End Google Tag Manager (noscript) -->
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
<div class="main" style="background-image: url('images/main.png')">

<!--    Change the image source '/images/default.jpg' with your favourite image.     -->

    <div class="cover black" data-color="black"></div>

<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

    <div class="container">
        <h1 class="logo cursive">
            영화 목록
        </h1>
<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->

        <div class="content">
            <div class="subscribe">
                <div class="motto">
                    
<table id="MovieList">
	
</table>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
      <div class="container">
             Made with <i class="fa fa-heart heart"></i> by <a href="https://github.com/dahee0325/MovieReservation">Movies Tim</a>.
      </div>
    </div>
 </div>
</body>
   <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/coming-sssoon.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
	
	$.ajax({
        url : 'http://localhost:8080/movie/movie',
        type : 'GET',
        success : function(data){
        	var html = '';

			for (var i = 0; i < data.length; i++) {
				html += '<tr class="movie">\n';
				html += '<td>영화제목 : ' + data[i].mName + ' </td>';
				html += '<td>영화내용 : ' + data[i].mCont + ' </td>';
				html += '<td>감독/배우 : ' + data[i].mPer + ' </td>';
				html += '<td>개봉일 : ' + data[i].mDate + '</td>';
				html += '<td>포스터 : <button onclick="movie(' + data[i].midx
				+ ')">'+ data[i].mPhoto +'</button></td>';
				html += '</tr>\n';
			}

			$('#MovieList').html(html);
        	
        	
        }
    });
	
});
	
	
	function movie(midx) {
		
		$.ajax({
			url : 'http://localhost:8080/movie/movie/' + midx,
			type : 'GET',
			success : function(data) {
				 if(data=='success'){
					 
                    }  
			}
		});

	}
        
     
	

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46172202-1', 'auto');
  ga('send', 'pageview');

  
  
</script>


</html>
