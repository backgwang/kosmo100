<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<article>
	<div class="sect-top">
		<h3 class="sub_page_title">문의상세보기</h3>
	</div>
	<div class="sect-cont">
		<div class="cont">
			<table class="table1 type">
				<colgroup>
					<col width="8%">
					<col width="92%">
				</colgroup>
				<tr>
					<td>번호</td>
					<td>${dto.gnum}</td>
				</tr>
		
				<tr>
					<td>제목</td>
					<td>${dto.gsubject}</td>
				</tr>
		
				<tr>
					<td>내용</td>
					<td><pre>${dto.gcontent}</pre></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>${dto.gdate}</td>
				</tr>
			</table>
			<div class="bottom_btn_wrap">
				<button class="btn btn_line btn_xs" type="button" id="updateBtn">수정</button>
				<button class="btn btn_primary btn_xs" type="button" id="deleteBtn">삭제</button>
				<button class="btn btn_outline_primary btn_xs" type="button" id="listBtn">리스트</button>
			</div>
		</div>
		<hr>
		<div class="cont">
			<ul class="comment_list">
				<c:forEach var="e" items="${dto.gogekcomm}">
					<li class="comment">
						<div class="comment_area">
							<div class="comment_nik">관리자</div>
							<div class="comment_cont"><textarea readonly>${e.gccontent}</textarea></div>
							<div class="comment_footer">
								<div class="comment_date">${e.gcdate}</div>
								<c:if test="${sessionScope.id == 'admin'}">
									<div class="comment_button_wrap">
										<button class="btn btn_sblue">수정</button>&nbsp;<button class="btn btn_sblue">삭제</button>
									</div>
								</c:if>
							</div>
						</div>
					</li>
				</c:forEach>
				<li class="comment_in">
					<form method="post" action="addComm">
						<input type="hidden" name="gcode" value="${dto.gnum}">
						<div class="comment_in_area">
							<div class="comment_nik">${sessionScope.id}</div>
							<div class="comment_cont"><textarea placeholder="댓글을 입력하세요." name="gccontent"></textarea></div>
							<div class="comment_in_button">
								<button type="submit" class="btn btn_line">등록</button>
							</div>
						</div>
					</form>
				</li>
			</ul>
		</div>
	</div>
</article>
<script>
	$(function() {
		$('#updateBtn').click(function(){
			location = "upform?gnum="+${dto.gnum};
		})
		
		$('#listBtn').click(function() {
			location = "list?gwriter=${sessionScope.id}";
		});
		$('#deleteBtn').click(function() {
			location = "delete?gnum=" + ${dto.gnum} +"&gwriter=${sessionScope.id}";
		});
	});
</script>