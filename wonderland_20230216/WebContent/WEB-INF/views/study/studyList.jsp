<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="sect-top">
		<h3 class="sub_page_title">스터디를 모집합니다</h3>
		<form action="list" method="post">
			<ul class="srch_area">
				<li><select class="select" name="searchType" id="searchType">
						<option selected value="">선택</option>
						<option value="1">제목</option>
						<option value="2">목적</option>
				</select>
				</li>
				<li class="ml10"><input type="text" class="input" id="searchValue" name="searchValue" value="${searchValue}" placeholder="검색어 입력" style="width: 300px;"></li>
				<li class="ml10"><button type="submit" class="btn btn_primary btn_xs">검색</button></li>
			</ul>
		</form>
	</div>
	<div class="sect-cont-flex">	
		<div class="cont">
			<table class="table1" id="list-table">
				<tbody>
					<c:forEach var="e" items="${list}">
					<tr>
						<td>
							<a href="detail?stnum=${e.stnum}">
								<div class="list-td">
									<div class="list_info">
										<div class="list_title">
											<div class="acc-tag">
												<span> 모집중 </span>
											</div>
											<h3 class="list_title_text">${e.sttitle}</h3>
										</div>
										<div class="list_body">
											<p class="list_info">${e.stcontent}</p>
											<div class="flex">
												<div class="box-tag">
													<c:forEach var="f" items="${e.keywords}">
														<button class="btn-tag"><span class="hash-tag">#</span><span class="keyword-tag">${f.keyword}</span></button>												
													</c:forEach>
												</div>
											</div>
										</div>
										<div class="list_info_footer">
											<div class="list_info_user">
												<span>${e.stwriter}</span>
												<span>&nbsp;·&nbsp;</span>
												<span>${e.stdate}</span>
											</div>
											<div class="list_info_detail">
												<dl>
													<dd><i class="bi bi-chat"></i> <span>${e.sccount}</span></dd>
													<dd><i class="bi bi-eye"></i> <span>${e.stcount}</span></dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
							</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="bottom_btn_wrap">
				<button type="button" class="btn btn_primary btn_xs" id="wbtn">글쓰기</button>
			</div>
		</div>
		
		<div class="side">
			<div class="side-box">
				<h3 class="side_title">인기 태그</h3>
				<ul>
					<li class="btn-tag"><i class="bi bi-hash"></i><span>키워드</span></li>
					<li class="btn-tag"><i class="bi bi-hash"></i><span>키워드라네</span></li>
					<li class="btn-tag"><i class="bi bi-hash"></i><span>키워드</span></li>
					<li class="btn-tag"><i class="bi bi-hash"></i><span>키워드다</span></li>
					<li class="btn-tag"><i class="bi bi-hash"></i><span>키워드</span></li>
					<c:forEach var="e" items="">
						<li></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="cont">
		<!-- paging -->
		<%@include file="../page/pageModule.jsp"%>
	</div>
</article>
<script>
$(function(){
	// 모집 글 폼 버튼
	$('#wbtn').click(function(){
		location = "form";
	});
});
</script>