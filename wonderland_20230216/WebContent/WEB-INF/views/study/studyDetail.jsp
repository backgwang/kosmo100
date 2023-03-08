<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<input type="hidden" name="stnum" value="${dto.stnum}">
	<input type="hidden" name="sttitle" value="${dto.sttitle}">
	<input type="hidden" name="stcontent" value="${dto.stcontent}">
	<div class="sect-cont">
		<div class="cont">
			<div class="board">
				<div class="board_head">
					<h2 class="board_title">${dto.sttitle}</h2>
					<div class="board_user">${dto.stwriter}</div>
					<div class="board_date">${dto.stdate}</div>
				</div>
				<div class="board_body">
					<div class="board_cont">
						<textarea readonly>${dto.stcontent}</textarea>
					</div>
					<div class="board_cont">
						<ul>
						<c:forEach var="e" items="${dto.keywords}">
							<li class="btn-tag">
								<input type='checkbox' name='keyword' value='"+keyword+"' checked style="display: none;"/>
								<i class="bi bi-hash"></i><span>${e.keyword}</span>
							</li>
						</c:forEach>
						</ul>
					</div>
				</div>
				<div class="board_footer flex">
					<div class="btn_box">
						<input type="button" value="수정" id="upBtn" class="btn btn_sblue btn_xs" />
						<input type="button" value="삭제" id="delBtn" class="btn btn_outline_sblue btn_xs" />
						<input type="hidden" value="${dto.stwriter}">
						<input type="hidden" value="${sessionScope.id}">
						<c:if test="${dto.stwriter == sessionScope.id}">
						<input type="button" value="신청 목록" id="subBtn" class="btn btn btn_primary btn_xs" />
						</c:if>
					</div>
					<div class="btn_box">
						<input type="button" value="글쓰기" id="writeBtn" class="btn btn btn_outline_primary btn_xs" />
							<input type="button" value="목록" id="listBtn" class="btn btn btn_primary btn_xs" />
					</div>
				</div>
			</div>
		</div>
		<div class="cont">
			<div class="comment_list">
				<div class="comment_in">
					<form method="post" action="addComm">
						<input type="hidden" name="stcode" value="${dto.stnum}">
						<input type="hidden" name="scwriter" value="${sessionScope.id}">
						<div class="comment_in_area">
							<div class="comment_nik">${sessionScope.id}</div>
							<div class="comment_cont"><textarea name="scpurpose" placeholder="댓글을 입력해주세요"></textarea></div>
							<div class="comment_in_button"><button type="submit" class="btn btn_line btn_xs">등록</button></div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="cont">
			<ul class="comment_list">
				<c:forEach var="e" items="${dto.studycomm}">
					<li class="comment">
						<div class="comment_area">
							<div class="comment_nik">${e.scwriter}</div>
							<div class="comment_cont"><textarea readonly>${e.sccontent}</textarea></div>
							<div class="comment_area">
								<div class="comment_date">${e.scdate}</div>
								<div class="comment_reply"><a id="reply">답글 쓰기</a></div>
							</div>
						</div>
						<div class="comment_re_area" style="display:none;">
							<div class="comment_in">
								<form method="post" action="addCommReply">
									<input type="hidden" name="sccode" value="${e.scnum}">
									<input type="hidden" name="scrwriter" value="${sessionScope.id}">
									<div class="comment_in_area">
										<div class="comment_nik">${sessionScope.id}</div>
										<div class="comment_cont"><textarea name="scpurpose" placeholder="댓글을 입력해주세요"></textarea></div>
										<div class="comment_in_button"><button type="submit" class="btn btn_line btn_xs">등록</button></div>
									</div>
								</form>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</article>
<script>
$(function(){
	$('#upBtn').click(function(){
		location = 'upform?stnum=${dto.stnum}';
	})
	$('#listBtn').click(function(){
		location = 'list';
	});
	$('#writeBtn').click(function(){
		location = 'form';
	});
	$('#reply').click(function(){
		console.log($(this).parent().parent().parent().next().css('display','inline-block'))
	})
})
</script>