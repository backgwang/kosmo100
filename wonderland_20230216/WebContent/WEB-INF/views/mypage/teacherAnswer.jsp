<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--2023. 1. 29. / Kosmo -->
<style>
.tablemgb50{
margin-bottom: 50px;
}
</style>
<article>
	<h3 class="sub_page_title">답변하기</h3>
	<div class="agree_terms">
	<div><i class="bi bi-brush"></i>질문</div>
		<table class="table1 type tablemgb50">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>이름 </td>
				<td>{김길동}</td>
			</tr>
			<tr>
				<td>질문내역</td>
				<td>{질문내용 쫘르르르르르르르르ㅡㄱ}</td>
			</tr>
		</table>
		<div><i class="bi bi-brush"></i>답변</div>
	<form action="" method="post">
		<table class="table1 type tablemgb50">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>이름</td>
				<td>선생인내이름</td>
			</tr>
			<tr>
				<td>답변하기</td>
				<td><textarea rows="6" class="textarea" name="trcontents" id="trcontents" placeholder="trcontents들어감"></textarea></td>
			</tr>
		</table>
		<div class="bottom_btn_wrap txt-r">
		<input type="submit" class="btn btn-primary" value="등록">
		<input type="button" class="btn btn-danger" value="취소">
		</div>
</form>
	</div>
</article>