<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<article>
	<div class="txt-c login-box box_area">
		<h3 class="sub_page_title">회원가입 완료</h3>
		<div class="agree_terms">
			<div class="agree_box txt-c">
				<img src="${pageContext.request.contextPath}/resources/images/icon_com.png" alt="" class="mt30">
				<h3 class="strong mt20">감사합니다.</h3>
				<p class="txt mt10 mb20">
					회원가입이 완료되었습니다.<br /> 확인 버튼을 클릭하시면 로그인 페이지로 이동합니다.
				</p>
			</div>
			<div class="bottom_btn_wrap txt-c">
				<button class="btn btn_primary btn_xs" type="button" id="mainBtn">확인</button>
			</div>
		</div>
	</div>
</article>
<script>
	$(function() {
		$('#mainBtn').click(function() {
			location = "login";
		});
	});
</script>