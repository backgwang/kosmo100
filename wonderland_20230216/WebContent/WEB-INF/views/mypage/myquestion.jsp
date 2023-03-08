<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="sect">
	<h3 class="sub_page_title sect-top">
		<i class="bi bi-brush"></i>�����ϱ�
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
					<td>�̸�</td>
					<td>${sessionScope.id }</td>
				</tr>
				<tr>
					<td>������</td>
					<td><select name="tcode" id="tcode"></select>
					</td>
				</tr>
				<tr>
					<td>��������</td>
					<td><textarea rows="6" class="textarea" name="tqcontent"
							id="tqcontent" placeholder="���� ����"></textarea></td>
				</tr>
			</table>
			<div class="bottom_btn_wrap txt-r">
				<input type="submit" class="btn btn-primary" value="���"> <input
					type="button" class="btn btn-danger" value="���">
			</div>
		</form>

	</article>
</div>

<script>
	// jQuert ����
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