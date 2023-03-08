<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- CSS 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- JS 파일 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<style>
/*reset*/
html,body,div,p,ul,ol,li,dl,dt,dd,table,tr,th,td,caption,form,fieldset,legend,address,header,aside,nav,main,section,article,footer,figure,figcaption,h1,h2,h3,h4,h5,h6,blockquote,button,input,label,select,textarea,pre{word-break:keep-all;font-family:'Pretendard',sans-serif;margin:0;padding:0;font-size:16px;font-weight:400;color:#111;}
header,nav,aside,section,article,main,footer,figure{display:block;}
li{list-style:none;}
a{text-decoration:none;color:inherit;box-sizing: border-box;}
a img{border:0;}
table{border-collapse:collapse;}
h1,h2,h3,h4,h5,h6{font-weight:400;}
em,i,address,cite{font-style:normal;}
button{border:0;outline:0;cursor:pointer;}
body, header, .sect, part {width:100%}
body, a, header{color: #111;}
a{display:block;}
ul li{list-style: none;}
.top-menu {display: flex; justify-content: space-between; background-color:#8167a1; vertical-align: middle;}
.top-menu ul{display: flex;margin-bottom: 0px;}
.logo a , .top-menu li{color:#fff;padding:20px 12px; vertical-align: middle;}
.top-menu li:before {content:''; position:absolute; right:-1px; top:50%; transform:translateY(-50%); width:1px; height:10px; background-color:#fff;}
.sect{padding-top:10px;background-color: #ccc;}
.part{display: flex; height: 100%;}
.part aside{width:220px; background-color: #fff; margin-right: 10px;}
.part article{width: 90%}
.cont{height:300px; padding:10px; margin-bottom: 10px;background-color: #fff; border:1px solid #fff; border-radius: 3px;}
.part .menu{padding:0;}
.menu li {border-bottom: 1px solid #ccc;margin:10px;}
.menu li a {padding: 8px 12px;}
</style>
</head>
<body>
	<header>
		<div class="top-menu">
			<h3 class="logo"><a href="#">WONDERLAND</a></h3>
			<ul>
				<li>시스템 관리자</li>
				<li>admin</li>
				<li><button type="button" class="btn btn-outline-warning">로그아웃</button></li>
			</ul>
		</div>
	</header>
	<div class="sect">
		<div class="part">
			<aside>
				<ul class="menu">
					<li class="nav-item"><a href="#">시스템 관리</a></li>
					<li class="nav-item"><a href="#">사이트 관리</a></li>
					<li class="nav-item"><a href="#">강좌 관리</a></li>
					<li class="nav-item"><a href="#">회원 관리</a></li>
					<li class="nav-item"><a href="#">게시판 관리</a></li>
					<li class="nav-item"><a href="#">시스템 관리</a></li>
				</ul>
			</aside>
			<article>
				<div class="cont">
					?
				</div>
				<div class="cont">
					?
				</div>
				<div class="cont">
					?
				</div>
			</article>
		</div>
		
	</div>
</body>
</html>