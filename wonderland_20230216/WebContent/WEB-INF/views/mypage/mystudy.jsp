<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--2023. 1. 28. / Kosmo -->
<style>
.personal_wrap h4 {
	font-size: 20px;
	font-family: 'notokr-medium';
	color: #000;
	display: block;
	margin-block-start: 1.33em;
	margin-block-end: 1.33em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.personal_wrap .basic table {
	margin-top: 10px;
	border: 1px solid #e2e2e2;
	background: #fff;
	border-bottom: 0px;
	width: 100%;
	border-spacing: 0;
}

.personal_wrap .basic table th {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.personal_wrap .basic table td {
	display: table-cell;
	vertical-align: middle;
}

.leftpp30 {
	width: 30%;
	float: left;
	box-sizing: border-box;
}

.rightpp70 {
	width: 50%;
	float: right;
	box-sizing: border-box;
}

.qwe123 {
	border: 2px solid #e6e6e6;
	text-align: center;
}

.qwe123 hr {
	background-color: #e6e6e6;
}

.qwe1234 {
	border: 3px solid #e6e6e6;
	text-align: center;
}

.qwe1234 hr {
	background-color: #e6e6e6;
}

.personal_wrap .basic table tr td {
	text-align: center;
	color: #005A89;
}

.mgb440 {
	margin-top: 440px;
	margin-bottom: 10px;
	font-size: 20px;
	font-family: 'notokr-medium';
	color: #000;
	display: block;
}
</style>
<article>

	<div>
		<div class="personal_wrap">
			<div class="basic">
				<h4>
					<img
						src="${pageContext.request.contextPath}/resources/images/title_icon02.png">
					<b>���͵� ��û ������Ȳ</b>
				</h4>
				<table class="table1">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>���͵� �̸�</th>
							<th>��û�� �̸�</th>
							<th>��û ����</th>
							<th>����</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>�Բ��ϴ� ���͵�</td>
							<td>��浿</td>
							<td>��û������ �����ϴ�</td>
							<td><input type="button" class="btn btn-primary" value="����">&nbsp;/&nbsp;
								<input type="button" class="btn btn-danger" value="�ź�"></td>
						</tr>
						<tr>
							<td>������</td>
							<td>��⸣��</td>
							<td>��;ƾƾƾƾƾӤ������̰ű���������̺���������ذ������������</td>
							<td><input type="button" class="btn btn-primary" value="����">&nbsp;/&nbsp;
								<input type="button" class="btn btn-danger" value="�ź�"></td>
						</tr>
						<tr>
							<td>��� ���͵�</td>
							<td>��浿</td>
							<td>���غ��ô�</td>
							<td><input type="button" class="btn btn-primary" value="����">&nbsp;/&nbsp;
								<input type="button" class="btn btn-danger" value="�ź�"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="personal_wrap">
		<div class="basic" style="margin-top: 100px;">
			<h4>
				<img
					src="${pageContext.request.contextPath}/resources/images/title_icon02.png"><b>
					���͵� ��û���� ��Ȳ</b>
			</h4>
		</div>
		<table class="table1">
			<colgroup>
				<col width="25%">
				<col width="40%">
				<col width="25%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>���͵� �̸�</th>
					<th>���͵� ����</th>
					<th>���͵� �Ⱓ</th>
					<th>����</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>�Բ��غ��� ���͵�</td>
					<td>�Բ��ϴ°� ������</td>
					<td>2001-07-08 ~ 2001-07-30<br><p style="color: red">D-${dto.dday}</p></td>
					<td><input type="button" class="btn btn-info" value="�����"></td>
				</tr>
			</tbody>
		</table>
	</div>
</article>
<script>
	$(function() {
		$('#abcdefg').click(function() {
			alert("alert ���������ߴµ� �ϴ��� �̻���� �⼮��Ȳ�̳� ���ǵ����ð� �̷��� ���������ھ��");
		});
	});
</script>
