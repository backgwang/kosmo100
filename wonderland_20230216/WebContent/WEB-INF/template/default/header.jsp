<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		clearTime(30); // 세션 만료 적용 시간 
		setTimer(); // 문서 로드시 타이머 시작

	});
	
	var initMinute; // 최초 설정할 시간(min)
	var remainSecond; // 남은시간(sec)

	function clearTime(min) { // 타이머 초기화 함수
		initMinute = min;
		remainSecond = min * 60;
	}
	
	function setTimer() { // 1초 간격으로 호출할 타이머 함수 

		// hh : mm 으로 남은시간 표기하기 위한 변수 
		remainMinute_ = parseInt(remainSecond / 60);
		remainSecond_ = remainSecond % 60;

		if (remainSecond > 0) {
			$("#timer").empty();
			$("#timer").append(
					'<a>' + Lpad(remainMinute_, 2) + ":"
							+ Lpad(remainSecond_, 2) + ' 남음</a>'); // hh:mm 표기
			remainSecond--;
			setTimeout("setTimer()", 1000); //1초간격으로 호출
		} else {
			/*세션 종료시 작동할 이벤트*/
			if (${sessionScope.id != undefined}) {
				location = "${pageContext.request.contextPath}/web/member/logout";
			}
			//location = "${pageContext.request.contextPath}/web/main";
		}
	}

	function Lpad(str, len) { // hh mm형식으로 표기하기 위한 함수
		str = str + "";
		while (str.length < len) {
			str = "0" + str;
		}
		return str;
	}
</script>
<div class="top-fixed-menu">
	<div class="top-menu-bar">
		<div class="inner">
			<div class="member-menu">
				<ul class="nav nav-bar">
					<c:choose>
						<c:when test="${empty sessionScope.id}">
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/login">로그인</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/join">회원가입</a></li>				
						</c:when>
						<c:when test="${sessionScope.id == 'admin'}">
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/logout">로그아웃</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/admin/">관리자 페이지</a></li>				
						</c:when>
						<c:otherwise>
							<li class="nav-item" ><a><span class="rblue"><b>${sessionScope.name}</b></span>&nbsp;님 안녕하세요</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/logout">로그아웃</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/mypage/info?sid=${sessionScope.id}">내 정보</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/mypage/lecture?sid=${sessionScope.id}">내 강의</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/mypage/study">내 스터디</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/gogek/list?gwriter=${sessionScope.id}">고객상담</a></li>
							<li class="nav-item" id="timer"></li>
							<li class="nav-item"><input type="button" class="btn btn_line time_ss" value="연장" onclick="clearTime(30)"></li>
						</c:otherwise>				
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	<div class="main-menu-bar">
		<div class="inner">
			<div class="main-menu">
				<h1 class="logo">
					<a href="${pageContext.request.contextPath}/web/main"><img src="${pageContext.request.contextPath}/resources/images/star_logo.png"></a>
				</h1>
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/web/teacher/list">선생님</a></li>
					<li><a href="${pageContext.request.contextPath}/web/study/list">스터디</a></li>
					<li><a href="${pageContext.request.contextPath}/web/notice/list">공지사항</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="inner">