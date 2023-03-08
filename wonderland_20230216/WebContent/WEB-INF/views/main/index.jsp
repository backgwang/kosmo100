<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="main_promo_zone">
		<div class="recommend">
			<!-- 
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" data-interval="true">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/winter-vacation.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/main_kor.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/main_eng.jpg"></a>
					</div>
					<div class="carousel-item">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/main_math.jpg"></a>
					</div>
				</div>
			</div>
			 -->
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" data-interval="3000">
				<!-- Indicators/dots -->
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="0" class="active"></button>
					<button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="1"></button>
					<button type="button" data-bs-target="#carouselExampleInterval" data-bs-slide-to="2"></button>
				</div>
			
				<!-- The slideshow/carousel -->
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/resources/images/main/winter-vacation.jpg" alt="Kosmo113" class="d-block w-100" style="width: 100%">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/images/main/main_kor.jpg" alt="Kosmo113" class="d-block w-100" style="width: 100%">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/images/main/main_eng.jpg" alt="Kosmo113" class="d-block w-100" style="width: 100%">
					</div>
				</div>
				<!-- Left and right controls/icons -->
				<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
					<span class="carousel-control-next-icon"></span>
				</button>
			</div>
		</div>
		<div class="event box">
			<div></div>
		</div>
	</div>
	<div class="main_teacher_zone" id="myTab">
		<ul class="nav-tabs">
		 	<li class="nav-item"><a class="nav-link active" href="tab" data-toggle="tab">국어</a></li>
			<li class="nav-item"><a class="nav-link" href="tab" data-toggle="tab">영어</a></li>
			<li class="nav-item"><a class="nav-link" href="tab" data-toggle="tab">수학</a></li>
		</ul>
		<div class="tab-content">
			<div class="show active in" id="tab">
				<ul class="flex" id="tlist">
					<c:forEach var="e" items="${teacher}">
					<li>
						<div class="timg-wrap">
							<a href="${pageContext.request.contextPath}/web/teacher/detail?tnum=${e.tnum}">
								<img src="${pageContext.request.contextPath}/resources/imgfile/${e.timgn}">
								<p class="tname">${e.tname}</p>
							</a>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="main_board_info">
		<div class="preview_notice">
			<div class="board_title_area">
				<div class="board_title_link">			
					<span class="title">공지사항</span>
					<span class="more_btn"><a href="notice/list">more&nbsp;<i class="bi bi-chevron-double-right"></i></a></span>
				</div>
			</div>
			<div class="board_content">
				<table class="table1 table2">
					<tbody>
					<c:forEach var="n" items="${notice}">
						<tr><td>${n.nsubject}</td></tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="preview_notice">
			<div class="board_title_area">
				<div class="board_title_link">			
					<span class="title">공지사항</span>
					<span class="more_btn"><a href="notice/list">more&nbsp;<i class="bi bi-chevron-double-right"></i></a></span>
				</div>
			</div>
			<div class="board_content">
				<table class="table1 table2">
					<tbody>
					<c:forEach var="n" items="${notice}">
						<tr><td>${n.nsubject}</td></tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</article>
<script>
$(function(){
	/*
	$('.nav-item a').click(function(){
		let idx = $('.nav-item a').index($(this));
		console.log(idx);
		$('.nav-item a:eq('+idx+')').addClass('active');
		$('.nav-item a').removeClass('active');
		$('.tab-content a').removeClass('active');
	});
	*/
	$('#myTab a').click(function (e) {
		e.preventDefault();
		$(this).tab('show');
	});
	
	$('.nav-link').click(function(){
		$.ajax({
			url : "test?subject="+$(this).text(),
			success : function(data){
				let tlist = "";
				$.each(data, function(i, element){
					tlist += '<li><div class="timg-wrap"><a href="teacher/detail?tnum='+element.tnum+'">'
						  + '<img src="${pageContext.request.contextPath}/resources/imgfile/'+element.timgn+'">'
						  + '<p class="tname">'+element.tname+'</p>'
						  + '</a></div></li>';
				});
				$('#tlist').html(tlist);
			}
		})
	})
	//$('.carousel').carousel();
})
</script>