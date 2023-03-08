<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<h3 class="sub_page_title">강의 등록</h3>
	<form method="post" action="add" enctype="multipart/form-data">

		<table class="table1 type">
			<colgroup>
				<col width="12%">
				<col width="88%">
			</colgroup>
			<tr>
				<td class="txt-c">과목</td>
				<td><select id="lsubject" class="form-select" name="lsubject">
						<option selected>과목을 선택하세요.</option>
						<option value="국어">국어</option>
						<option value="영어">영어</option>
						<option value="수학">수학</option>
				</select></td>
			</tr>
			<tr style="text-align: center;">
				<td>선생님</td>
				<td><select name="tcode" id="tcode">
					<option>선택</option>
					
				</select></td>
			</tr>
			<tr>
				<td class="txt-c">강의 사진</td>
				<td>
					<div class="col-sm-10">
						<input type="file" name="mfile" id="mfile" />
					</div>
				</td>
			</tr>
			<tr>
				<td class="txt-c">강의이름</td>
				<td><input type="text" name="ltitle" class="input type1" placeholder="강의 이름을 입력하세요." /></td>
			</tr>
			<tr>
				<td class="txt-c">강의 총 시간</td>
				<td><input type="number" name="lruntime" class="input type1" placeholder="강의 총 시간을 입력하세요." /></td>
			</tr>
			<tr>
				<td class="txt-c">강의 개수</td>
				<td><input type="number" name="lcount" class="input type1" placeholder="강의 개수를 입력하세요." /></td>
			</tr>
			<tr>
				<td class="txt-c">난이도</td>
				<td><select id="select" class="form-select" name="ldiff" aria-label="Default select example">
						<option selected>난이도를 고르세요</option>
						<option value="초급">초급</option>
						<option value="중급">중급</option>
						<option value="상급">상급</option>
				</select></td>
			</tr>
			<tr>
				<td class="txt-c">강의 소개</td>
				<td><textarea name="linfo" class="textarea" placeholder="강의 내용을 입력하세요."
						rows="6" cols="70"></textarea></td>
			</tr>
		</table>
		<div class="btn_wrap txt-r">
			<button type="submit" class="btn btn-outline-primary btn-xxs">등록</button>
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
				$('#tcode').append('<option>선택</option>');
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