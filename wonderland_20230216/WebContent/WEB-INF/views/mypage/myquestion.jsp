<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="sect">
	<h3 class="sub_page_title sect-top">
		<i class="bi bi-brush"></i>질문하기
	</h3>
</div>
<div class="part">
	<article>
		<form action="addquestion" method="post">
		<input type="hidden" value="${sessionScope.id }" id="tqwriter" name="tqwriter">
			<table class="table1 type tablemgb50">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>이름</td>
					<td>${sessionScope.id }</td>
				</tr>
				<tr>
					<td>선생님</td>
					<td><select name="tcode" id="tcode"></select>
					</td>
				</tr>
				<tr>
					<td>질문내역</td>
					<td><textarea rows="6" class="textarea" name="tqcontent"
							id="tqcontent" placeholder="질문 내용"></textarea></td>
				</tr>
			</table>
			<div class="bottom_btn_wrap txt-r">
				<input type="submit" class="btn btn-primary" value="등록"> <input
					type="button" class="btn btn-danger" value="취소">
			</div>
		</form>

	</article>
</div>

<script>
	// jQuert 시작
	$(function() {
		
		$.ajaxSetup({
			cache : false
		});
		$.ajax({
			url : "../list",
			success : function(jsondata) {
				$.each(jsondata, function(k, v) { 
					$('#tcode').append("<option value='"+v.tnum+"'>"+v.tname+"</option>");	
				});
				$("#tcode option:eq("+${tnum}+")").prop("selected", true);
			}
		});

	});
</script>