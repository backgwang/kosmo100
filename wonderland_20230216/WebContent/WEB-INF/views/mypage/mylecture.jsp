<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/c3.css">
<script src="${pageContext.request.contextPath}/resources/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/c3.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sect">
	<div class="part">
		<aside>
			<ul class="lnb-tabs">
				<li class="lnb-item"><a href="info?sid=${sessionScope.id }">내 정보</a></li>
				<li class="lnb-item"><a href="#" class="selected">내 강의</a></li>
				<li class="lnb-item"><a href="study">내 스터디</a></li>
			</ul>
		</aside>
		<article>
			<div class="sect-top">
				<h3 class="sub_page_title">내 강의</h3>
			</div>
			<div class="cont">
				<table class="table table-bordered table23 tableplus23">
				<colgroup>
		            <col width="20%" />
		            <col width="50%" />
		            <col width="15%" />
		            <col width="15%" />
		        </colgroup>
		        <thead>
	            <tr id="target">
	
	            </tr>
			</table>
			</div>
			<div class="cont">
				<div class="mylecture">
					<!-- tabs -->
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab-1" data-bs-target="#tab-1">수강중인 강의</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab-2" data-bs-target="#tab-2" id="endlectures">종료된 강의</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active in" id="tab-1">
							<table class="table1">
								<colgroup>
									<col width="70%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<thead>
									<tr>
										<td>강의 정보</td>
										<td>수강 상태</td>
										<td colspan="2">진행률</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${list}">
										<c:forEach var="f" items="${e.lectures}">
											<tr>
												<td>
													<a href="#" id="${f.lsnum}" class="abc">
														<img src="${pageContext.request.contextPath}/resources/images/icon_com.png"><b>${f.lstitle}</b>
													</a>
												</td>
												<td><b>${e.tname}</b><br>선생님</td>
												<td><b>강의수</b><br>${f.cnt}개</td>
												<td><b>진도율</b><br>{999}%</td>
											</tr>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade in" id="tab-2">
							<div class="txt-c">

							</div>
							<table class="table1">
								<colgroup>
									<col width="30%" />
									<col width="55%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr>
										<td colspan="2">강의 정보</td>
										<td>수강 결과</td>
									</tr>
								</thead>
								<tbody id="endtarget">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="cont">
				<div class="section100">
					<b>${sessionScope.id}</b> 님의 질문내역
				</div>
				<table class="table1">
					<thead>
						<tr>
							<td>선생님</td>
							<td>질문 내용</td>
							<td>답변 여부</td>
							<td>작성날짜</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${list}">
							<c:forEach var="f" items="${e.question}">
								<tr>
									<td>${e.tname}</td>
									<td><a href="${pageContext.request.contextPath}/web/mypage/mylecture">${f.tqcontent}</a></td>
									<td>${f.tqstats}</td>
									<td>${f.tqdate}</td>
								</tr>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="section100">
				<b>${sessionScope.id}</b> 님의 댓글내역
			</div>
			<table class="table1">
				<thead>
					<tr>
						<td>선생님 및 강좌</td>
						<td>내용</td>
						<td>별점</td>
						<td>작성 날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${list}">
						<c:forEach var="f" items="${e.lectures}">
							<c:forEach var="g" items="${f.lecturesReview}">
								<tr>
									<td><b>${e.tname}</b>선생님의<br><b>${f.lstitle} 강좌</b></td>
									<td>${g.lrcontent}</td>
									<td>★★★★★ ${g.lrstar}.0</td>
									<td>${g.lrdate}</td>
								</tr>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</article>
	</div>
</div>
<script>
$(function(){
	$('#endlectures').click(function() {
		$.ajaxSetup({
			cache : false
		});
		$.ajax({
			url: '../endlectures?sid=${sessionScope.id}',
			success: function(jsondata) {
				$('#endtarget').empty();
				$.each(jsondata, function(a, b) {
					$('#endtarget').append('<tr><td><img src = "${pageContext.request.contextPath}/resources/images/'+b.timgn+'"></td><td><div><b>'+b.tname+' </b>선생님</div><div>제목 : '+b.lectures[0].lstitle+'</div></td><td><b>강의 수</b><div>1/'+b.lectures[0].cnt+'</div></td></tr>');
				});
			
			
			}
			
		});
	});
	
	


	// Tabs
	$(".tab_box .tabs button").click(function() {
		var tab_id = $(this).attr('data-tab');
		$(".tab_box .tabs button").removeClass('on');
		$(".tab_box .tabs_content > li").removeClass('on');
		$(this).addClass('on');
		$("#" + tab_id).addClass('on');
	});

	
	
	$('.abc').click(function() {
		// console.log($(this).attr('id'));
		let $lsnum = parseInt($(this).attr('id'));
		console.log($lsnum);
		$.ajaxSetup({
			cache : false
		});
		$.ajax({
			url: '../info?sid=${sessionScope.id}&lsnum=' + $lsnum,
			success: function(jsondata) {
				console.log(jsondata);
				let test = "";
				test += "<td><div id='chart'></div></td><td><b>"+jsondata.lstitle+"</b><br>"+jsondata.lsinfo+"</td><td><b>진행중인 강의</b><br>{15/40}</td>";
				if (jsondata.cnt != 0) {
					test += "<td class='txt-c'>수강댓글<br><b style='color:blue;'>[등록]</b></td>";
				} else {
					test += "<td class='txt-c'>수강댓글<br><b style='color:red;'>[미등록]</b><br><input type='button' value='작성하기' class='btn btn-primary mt30'></td>";
				}
				$('#target').html(test);
			    let charttitle = 15 / 40 * 100;
			
			    var chart = c3.generate({
			        data : {
			            columns : [ [ '수강한 강의', 15 ], [ '수강하지 않은 강의', 25 ], ],
			            type : 'donut',
			        },
			        donut : {
			            title : charttitle + "%"
			        },
			        size : {
			            width : 150,
			            height : 150
			
			        },
			        color : {
			            pattern : [ '#1f77b4', '#eaeaea' ],
			        }
			    });
			}
		});
	});
});
</script>