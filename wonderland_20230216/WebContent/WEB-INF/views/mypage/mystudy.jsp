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
					<b>스터디 신청 받은현황</b>
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
							<th>스터디 이름</th>
							<th>신청자 이름</th>
							<th>신청 이유</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>함께하는 스터디</td>
							<td>김길동</td>
							<td>신청이유는 없습니다</td>
							<td><input type="button" class="btn btn-primary" value="수락">&nbsp;/&nbsp;
								<input type="button" class="btn btn-danger" value="거부"></td>
						</tr>
						<tr>
							<td>에헤헤</td>
							<td>김기르동</td>
							<td>우와아아아아아앙ㅇㅇㅇ이거길어지면테이블깨져누나해결해줘어어어어엉ㅇ</td>
							<td><input type="button" class="btn btn-primary" value="수락">&nbsp;/&nbsp;
								<input type="button" class="btn btn-danger" value="거부"></td>
						</tr>
						<tr>
							<td>우왕 스터디</td>
							<td>김길동</td>
							<td>잘해봅시다</td>
							<td><input type="button" class="btn btn-primary" value="수락">&nbsp;/&nbsp;
								<input type="button" class="btn btn-danger" value="거부"></td>
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
					스터디 신청중인 현황</b>
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
					<th>스터디 이름</th>
					<th>스터디 목적</th>
					<th>스터디 기간</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>함께해볼까 스터디</td>
					<td>함께하는게 목적임</td>
					<td>2001-07-08 ~ 2001-07-30<br><p style="color: red">D-${dto.dday}</p></td>
					<td><input type="button" class="btn btn-info" value="대기중"></td>
				</tr>
			</tbody>
		</table>
	</div>
</article>
<script>
	$(function() {
		$('#abcdefg').click(function() {
			alert("alert 쓰지말라했는데 일단은 이사람의 출석현황이나 강의들은시간 이런거 나오면좋겠어요");
		});
	});
</script>
