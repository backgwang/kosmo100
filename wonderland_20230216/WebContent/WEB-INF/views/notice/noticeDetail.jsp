<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sect">
	<article>
		<h1 class="sub_page_title">��������</h1>
		<div class="board">
			<div class="board_head">
				<h2 class="board_title">${dto.nsubject}</h2>
				<div class="board_user">������</div>
				<div class="board_date">����� : ${dto.ndate}</div>
			</div>
			<div class="board_body">
				<textarea readonly>${dto.ncontent}</textarea>
			</div>
			<div class="board_footer">
				<div class="bottom_btn_wrap">
					<c:if test="${sessionScope.id == 'admin'}">
						<button class="btn btn_sblue btn-xs" type="button" id="updateBtn">����</button>
						<button class="btn btn_grey btn-xs ml10" type="button" id="deleteBtn">����</button>
					</c:if>
					<button class="btn btn_primary btn-xs ml10" type="button" id="listBtn">����Ʈ</button>
				</div>
			</div>
		</div>
	</article>
</div>
<script>
	$(function() {
		$('#listBtn').click(function() {
			location = "list";
		});
		$('#updateBtn').click(function() {
			location = "upform?nnum="+${dto.nnum};
		});
		$('#deleteBtn').click(function() {
			location = "delete?nnum="+${dto.nnum};
		});
	});
</script>