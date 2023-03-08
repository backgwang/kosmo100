<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<h3 class="sub_page_title">공지 등록</h3>
	<form method="post" action="add">
		<input type="hidden" name="nwriter" value="${sessionScope.id}">
		<table class="table1 type">
		<colgroup>
			<col width="15%">
			<col width="85%">
		</colgroup>
			<tr>
				<td class="txt-c">제목</td>
				<td><input type="text" name="nsubject" class="input type1" placeholder="제목을 입력하세요." /></td>
			</tr>
			<tr>
				<td class="txt-c">고정글 여부</td>
				<td><input type="radio" name="nfix" value="Y" />&nbsp;예&nbsp;&nbsp;<input type="radio" name="nfix" value="N" />&nbsp;아니오</td>
			</tr>
			<tr>
				<td class="txt-c">공지 내용</td>
				<td><textarea name="ncontent" class="textarea" id="ncontent" rows="3"></textarea></td>
			</tr>
		</table>
		<div class="bottom_btn_wrap txt-r">
			<button class="btn btn_outline_primary btn-xs" type="button" id="listBtn">목록</button>
			<button class="btn btn_primary btn-xs" type="submit" id="wbtn">등록</button>
		</div>
	</form>
</article>
<script>
$(function(){
	$('#listBtn').click(function(){
		location = 'list';
	})
})
</script>