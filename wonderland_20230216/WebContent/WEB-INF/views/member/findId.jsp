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
						<h3 class="sub_page_title mt30">�����մϴ�.</h3>
						<p class="txt mt10 mb10">������ �Ϸ�Ǿ����ϴ�.</p>
						<p>ȸ������ ���̵�� <b>${id }</b> �Դϴ�.</p>
						<p>�ش� ���̵�� �ٽ� �α��� ���ֽñ� �ٶ��ϴ�.</p>	
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
		<button class="btn btn_primary btn_s" type="button" id="mainBtn">�α��� �Ϸ� ����</button>
	</div>
</article>
<script>
	$(function() {
		$('#mainBtn').click(function() {
			location = "login";
		});
	});
</script>