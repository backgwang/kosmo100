<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<h3 class="sub_page_title">���� ���</h3>
	<form method="post" action="add" enctype="multipart/form-data">

		<table class="table1 type">
			<colgroup>
				<col width="12%">
				<col width="88%">
			</colgroup>
			<tr>
				<td class="txt-c">����</td>
				<td><select id="lsubject" class="form-select" name="lsubject">
						<option selected>������ �����ϼ���.</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
				</select></td>
			</tr>
			<tr style="text-align: center;">
				<td>������</td>
				<td><select name="tcode" id="tcode">
					<option>����</option>
					
				</select></td>
			</tr>
			<tr>
				<td class="txt-c">���� ����</td>
				<td>
					<div class="col-sm-10">
						<input type="file" name="mfile" id="mfile" />
					</div>
				</td>
			</tr>
			<tr>
				<td class="txt-c">�����̸�</td>
				<td><input type="text" name="ltitle" class="input type1" placeholder="���� �̸��� �Է��ϼ���." /></td>
			</tr>
			<tr>
				<td class="txt-c">���� �� �ð�</td>
				<td><input type="number" name="lruntime" class="input type1" placeholder="���� �� �ð��� �Է��ϼ���." /></td>
			</tr>
			<tr>
				<td class="txt-c">���� ����</td>
				<td><input type="number" name="lcount" class="input type1" placeholder="���� ������ �Է��ϼ���." /></td>
			</tr>
			<tr>
				<td class="txt-c">���̵�</td>
				<td><select id="select" class="form-select" name="ldiff" aria-label="Default select example">
						<option selected>���̵��� ������</option>
						<option value="�ʱ�">�ʱ�</option>
						<option value="�߱�">�߱�</option>
						<option value="���">���</option>
				</select></td>
			</tr>
			<tr>
				<td class="txt-c">���� �Ұ�</td>
				<td><textarea name="linfo" class="textarea" placeholder="���� ������ �Է��ϼ���."
						rows="6" cols="70"></textarea></td>
			</tr>
		</table>
		<div class="btn_wrap txt-r">
			<button type="submit" class="btn btn-outline-primary btn-xxs">���</button>
		</div>
	</form>
</article>
<script>
$(function() {
	$('#lsubject').change(function(){
		$('#tcode').empty();
		let lsubject = $('#lsubject').val();
		console.log(lsubject);
		$.ajax({
			url : '../getTeacher?lsubject='+lsubject,
			success : function(jsonData){
				//console.log(jsonData);
				$('#tcode').append('<option>����</option>');
				$.each(jsonData, function(k, v){
					if (k != 0) {
						$('#tcode').append('<option value="'+v.tnum+'">'+v.tname+'</option>');
					}
				});
			}
		});
	});
});
</script>