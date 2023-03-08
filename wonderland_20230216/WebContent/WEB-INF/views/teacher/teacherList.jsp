<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sect">
	<div class="sect-top">
		<h3 class="sub_page_title">선생님</h3>
	</div>
	<div class="sect-cont">
		<div class="inner mb50">
			<div class="tab_box" id="myTab">
				<!-- tabs -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" href="#tab-1" data-toggle="tab" data-bs-target="#tab-1">국어</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab-2" data-toggle="tab" data-bs-target="#tab-2">영어</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab-3" data-toggle="tab" data-bs-target="#tab-3">수학</a></li>
				</ul>
				<!-- //tabs -->
				<div class="tab-content">
					<div class="tab-pane fade show active in" id="tab-1">
						<div class="tarea">
							<ul class="tlist">
							<c:forEach var="e" items="${list}">
								<c:if test="${e.subject == '국어'}">
								<li class="tbox">
									<a href="detail?tnum=${e.tnum}">
										<div class="timg-wrap">
											<img data-src="holder.js/100%x150" src="${pageContext.request.contextPath}/resources/imgfile/${e.timgn}" />
										</div>
										<div class="caption txt-c">
											<h3 class="sub_page_stitle mt5"><b>${e.tname}</b></h3>
										</div>
									</a>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="tab-2">
						<div class="tarea">
							<ul class="tlist">
							<c:forEach var="e" items="${list}">
								<c:if test="${e.subject == '수학'}">
								<li class="tbox">
									<a href="detail?tnum=${e.tnum}">
										<div class="timg-wrap">
											<img data-src="holder.js/100%x150" src="${pageContext.request.contextPath}/resources/imgfile/${e.timgn}" />
										</div>
										<div class="caption txt-c">
											<h3 class="sub_page_stitle mt5"><b>${e.tname}</b></h3>
										</div>
									</a>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="tab-3">
						<div class="tarea">
							<ul class="tlist">
							<c:forEach var="e" items="${list}">
								<c:if test="${e.subject == '영어'}">
								<li class="tbox">
									<a href="detail?tnum=${e.tnum}">
										<div class="timg-wrap">
											<img data-src="holder.js/100%x150" src="${pageContext.request.contextPath}/resources/imgfile/${e.timgn}" />
										</div>
										<div class="caption txt-c">
											<h3 class="sub_page_stitle mt5"><b>${e.tname}</b></h3>
										</div>
									</a>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// Tabs
	$(".tab_box .tabs button").click(function() {
		var tab_id = $(this).attr('data-tab');
		$(".tab_box .tabs button").removeClass('on');
		$(".tab_box .tabs_content > li").removeClass('on');
		$(this).addClass('on');
		$("#" + tab_id).addClass('on');
	})
</script>
