<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<article>
	<div class="txt-c login-box box_area">
		<h3 class="sub_page_title">ȸ������ �Ϸ�</h3>
		<div class="agree_terms">
			<div class="agree_box txt-c">
				<img src="${pageContext.request.contextPath}/resources/images/icon_com.png" alt="" class="mt30">
				<h3 class="strong mt20">�����մϴ�.</h3>
				<p class="txt mt10 mb20">
					ȸ�������� �Ϸ�Ǿ����ϴ�.<br /> Ȯ�� ��ư�� Ŭ���Ͻø� �α��� �������� �̵��մϴ�.
				</p>
			</div>
			<div class="bottom_btn_wrap txt-c">
				<button class="btn btn_primary btn_xs" type="button" id="mainBtn">Ȯ��</button>
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