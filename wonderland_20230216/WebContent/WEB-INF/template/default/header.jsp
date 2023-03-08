<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		clearTime(30); // ���� ���� ���� �ð� 
		setTimer(); // ���� �ε�� Ÿ�̸� ����

	});
	
	var initMinute; // ���� ������ �ð�(min)
	var remainSecond; // �����ð�(sec)

	function clearTime(min) { // Ÿ�̸� �ʱ�ȭ �Լ�
		initMinute = min;
		remainSecond = min * 60;
	}
	
	function setTimer() { // 1�� �������� ȣ���� Ÿ�̸� �Լ� 

		// hh : mm ���� �����ð� ǥ���ϱ� ���� ���� 
		remainMinute_ = parseInt(remainSecond / 60);
		remainSecond_ = remainSecond % 60;

		if (remainSecond > 0) {
			$("#timer").empty();
			$("#timer").append(
					'<a>' + Lpad(remainMinute_, 2) + ":"
							+ Lpad(remainSecond_, 2) + ' ����</a>'); // hh:mm ǥ��
			remainSecond--;
			setTimeout("setTimer()", 1000); //1�ʰ������� ȣ��
		} else {
			/*���� ����� �۵��� �̺�Ʈ*/
			if (${sessionScope.id != undefined}) {
				location = "${pageContext.request.contextPath}/web/member/logout";
			}
			//location = "${pageContext.request.contextPath}/web/main";
		}
	}

	function Lpad(str, len) { // hh mm�������� ǥ���ϱ� ���� �Լ�
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
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/login">�α���</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/join">ȸ������</a></li>				
						</c:when>
						<c:when test="${sessionScope.id == 'admin'}">
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/logout">�α׾ƿ�</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/admin/">������ ������</a></li>				
						</c:when>
						<c:otherwise>
							<li class="nav-item" ><a><span class="rblue"><b>${sessionScope.name}</b></span>&nbsp;�� �ȳ��ϼ���</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/member/logout">�α׾ƿ�</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/mypage/info?sid=${sessionScope.id}">�� ����</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/mypage/lecture?sid=${sessionScope.id}">�� ����</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/mypage/study">�� ���͵�</a></li>
							<li class="nav-item" ><a href="${pageContext.request.contextPath}/web/gogek/list?gwriter=${sessionScope.id}">�����</a></li>
							<li class="nav-item" id="timer"></li>
							<li class="nav-item"><input type="button" class="btn btn_line time_ss" value="����" onclick="clearTime(30)"></li>
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
					<li><a href="${pageContext.request.contextPath}/web/teacher/list">������</a></li>
					<li><a href="${pageContext.request.contextPath}/web/study/list">���͵�</a></li>
					<li><a href="${pageContext.request.contextPath}/web/notice/list">��������</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="inner">