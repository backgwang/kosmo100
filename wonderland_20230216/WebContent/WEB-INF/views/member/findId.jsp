<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="login-box box_area">
		<div class="agree_terms">
			<div class="agree_box txt-c">
				<c:choose>
					<c:when test="${id != null }">
						<img src="${pageContext.request.contextPath}/resources/images/icon_com.png" alt="">
						<h3 class="sub_page_title mt30">감사합니다.</h3>
						<p class="txt mt10 mb10">인증이 완료되었습니다.</p>
						<p>회원님의 아이디는 <b>${id }</b> 입니다.</p>
						<p>해당 아이디로 다시 로그인 해주시기 바랍니다.</p>	
					</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/images/icon_com.png" alt="">
							<p><b>${msg }</b></p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="btn_wrap txt-c">
		<button class="btn btn_primary btn_s" type="button" id="mainBtn">로그인 하러 가기</button>
	</div>
</article>
<script>
	$(function() {
		$('#mainBtn').click(function() {
			location = "login";
		});
	});
</script>