<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<form action="addStudy" method="post" id="studyForm">
		<input type="hidden" name="stwriter" value="${sessionScope.id}"/>
		<h3 class="sub_page_title">스터디 모집 글 작성</h3>
		<table class="table1 type" id="studyForm">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>스터디 이름</td>
				<td><input type="text" name="sttitle" class="input" value="${dto.sttitle}" required/></td>
			</tr>
			<tr>
				<td>스터디 목적</td>
				<td><textarea rows="3" cols="12" name="stpurpose" class="textarea" required>${dto.stpurpose}</textarea></td>
			</tr>
			<tr>
				<td>모집 인원</td>
				<td><input type="number" name="stheadcount" class="input type1" value="${dto.stheadcount}" required/></td>
			</tr>
			<tr>
				<td>모집 기간</td>
				<td>
					<input type="date" name="startdate" class="input type1" value="${dto.startdate}" required/>&nbsp;~&nbsp;<input type="date" name="enddate" class="input type1" value="${dto.enddate}" required/>
					<p id="targetDate"></p>
				</td>
			</tr>
			<tr>
				<td>모집 키워드</td>
				<td class="keyword-td">
					<ul id="target" class="box-tag">
						<c:forEach var="e" items="${dto.keywords}">
							<li class='btn-tag'>
								<input type='checkbox' name='keyword' value='"+keyword+"' checked />
								<span class='hash-tag'>#</span><span>${e.keyword}</span><span class='cancle-tag'><i class='bi bi-x-lg'></i></span>
							</li>
						</c:forEach>
					</ul>
					<div class="keyword-input">
						<input type="text" class="input type1" id="keyword" />&nbsp;<input type="button" class="btn btn_outline_primary" id="keywordBtn" value="입력">
						<p id="warning"></p>						
						<p class="tb_txt_S"><span class="red">*</span> 최대 5개까지 선택 할 수 있습니다</p>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="bgwhite">
					<div class="fl_right">
						<input type="button" value="목록" id="lbtn" class="btn btn_outline_primary" /> 
						<input type="button" value="글쓰기" id="wbtn" class="btn btn_primary" />
					</div>
				</td>
			</tr>
		</table>
	</form>
</article>
<script>
$(function() {
	$('#lbtn').click(function(){
		location = "list";
	});
	$('#wbtn').click(function() {
        if ($('input[name="keyword"]').val() == undefined) {
            $('#target').append("<input type='hidden' name='keyword' value='' />");
        }
        $('#studyForm').submit();
    });
	$('#keywordBtn').click(function(){
		$('#warning').html("");
		if ($('#target').children().length > 4) {
			$('#warning').html('키워드는 최대 5개까지 입력 가능합니다').css('color','red');
		} else {
			let keyword = $('#keyword').val();
			if ($('#target > a').children().text() === "") {
				$('#target').append("<li class='btn-tag'><input type='checkbox' name='keyword' value='"+keyword+"' checked />"
									+"<span class='hash-tag'>#</span><span>"+keyword+"</span><span class='cancle-tag'><i class='bi bi-x-lg'></i></span></li>");
			} else {
				let e = 0;
				$('#target > a').each(function(i, element) {
					if ($(this).children().eq(2).text() == keyword) {
						e = 1;
					}
				});
				if (e === 0) {
					$('#target').append("<li class='btn-tag'><input type='checkbox' name='keyword' value='"+keyword+"' checked />"
							+"<span class='hash-tag'>#</span><span>"+keyword+"</span><span class='cancle-tag'><i class='bi bi-x-lg'></i></span></li>");
				} else {
					$('#warning').html('중복된 키워드 입니다.').css('color','blue');
				}
			}
		}
		$('input[type="checkbox"]').css('display','none');
		$('#keyword').val("");
		$('.btn-tag').click(function() {
			$(this).remove();
		});
	});
	
	let now = new Date();
	let today = leadingZeros(now.getFullYear(), 4) + '-' + leadingZeros(now.getMonth() + 1, 2) + '-' + leadingZeros(now.getDate(), 2);
	$("input[name='startdate']").change(function(){
		if($(this).val() < today){
			$('#targetDate').html('<span style="color:red;">오늘 이전의 날짜를 선택할 수 없습니다.</span>');
			$(this).val('');
		} else {
			$('#targetDate').empty();
		}
	});
	$("input[name='enddate']").change(function(){
		if($(this).val() < $("input[name='startdate']").val()){
			$('#targetDate').html('<span style="color:#322cbd;">모집 완료 날짜보다 모집 가능 날짜가 늦을 수 없습니다.</span>');
			$(this).val('');
		} else if ( $(this).val() < today ){
			$('#targetDate').html('<span style="color:red;">오늘 이전의 날짜를 선택할 수 없습니다.</span>');
			$(this).val('');
		} else {
			$('#targetDate').empty();
		}
	});
	
	let start = $('input[name="startdate"]').val();
	start = Date.parse(start);
	console.log("시작 시간 : "+start);
});

function leadingZeros(n, digits){
	var zero = '';
	n = n.toString();
	
	if( n.length < digits ){
		for(i=0; i<digits - n.length; i++){
			zero += '0';
		}
	}
	return zero + n;
}
</script>
