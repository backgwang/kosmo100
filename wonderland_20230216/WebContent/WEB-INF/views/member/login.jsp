<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="box_area login-box">
		<h3>안녕하세요? 고객님 반갑습니다.</h3>
		<form method="post" action="loginProcess" onsubmit="return frm_check()" id="loginForm">
			<div class="mt40">
				<input type="text" class="input_txt inp_l" placeholder="아이디를 입력하세요" name="sid" id="sid">
				<input type="password" class="input_txt inp_l mt10" placeholder="비밀번호를 입력하세요." name="spwd" id="spwd">
			</div>
			<div id="target" class="error_message txt-c"></div>
			<ul class="flex mt20">
				<li class="checkbox"><input type="checkbox" name="checkId" id="saveId"> <label for="saveId">아이디 저장</label></li>
				<li class="txt-r mt10"><a href="searchidpwd" class="btn_arrow span"><span>아이디 또는 비밀번호를 잊으셨나요?</span>
				</a></li>
			</ul>
			<div class="bottom_btn_wrap txt-c">
				<button class="btn btn_primary btn_s" type="button" id="loginBtn">로그인</button>
				<button class="btn btn_line btn_s mt10" type="button" id="joinBtn">회원가입</button>
			</div>
		</form>
	</div>
</article>
<script>
$(function() {
	// 쿠키 저장하는 함수
	fnInit();
	
	// 회원가입 버튼 클릭 시 페이지 이동
	$('#joinBtn').click(function() {
		location = "join";
	});
	
	// 로그인 버튼 클릭 시 ajax 함수 실행
	$('#loginBtn').click(function() {
		submitCheck();
	});
	
	// 엔터 클릭 시 로그인 버튼 함수 실행
	$('#sid').keyup(function(event) {
		if (event.which === 13) {
			submitCheck();
		}
	});
	
	$('#spwd').keyup(function(event) {
		if (event.which === 13) {
			submitCheck();
		}
	});
});

function frm_check() {
	saveid();
}

function fnInit() {
	var cookieid = getCookie("saveid");
	console.log(cookieid);
	if (cookieid != "") {
		$("input:checkbox[id='saveId']").prop("checked", true);
		$('#sid').val(cookieid);
	}

}

function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setTime(todayDate.getTime() + 0);
	if (todayDate > expiredays) {
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ expiredays + ";";
	} else if (todayDate < expiredays) {
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";";
	}

	console.log(document.cookie);
}

function getCookie(Name) {
	var search = Name + "=";
	console.log("search : " + search);

	if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
		offset = document.cookie.indexOf(search);
		console.log("offset : " + offset);
		if (offset != -1) { // 쿠키가 존재하면 
			offset += search.length;
			// set index of beginning of value
			end = document.cookie.indexOf(";", offset);
			console.log("end : " + end);
			// 쿠키 값의 마지막 위치 인덱스 번호 설정 
			if (end == -1)
				end = document.cookie.length;
			console.log("end위치  : " + end);

			return unescape(document.cookie.substring(offset, end));
		}
	}
	return "";
}

function saveid() {
	var expdate = new Date();
	if ($("#saveId").is(":checked")) {
		expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
		setCookie("saveid", $("#sid").val(), expdate);
	} else {
		expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
		setCookie("saveid", $("#sid").val(), expdate);
	}
}
function submitCheck() {
	$.ajax({
		url : "../loginChk?sid=" + $('#sid').val() + "&spwd=" + $('#spwd').val(),
		success : function(data) {
			if (data == 0) {
				$('#target').html("아이디 또는 비밀번호를 잘 못 입력했습니다.<br> 입력하신 내용을 다시 확인해주세요.");

			} else {
				$('#loginForm').submit();
			}
		}
	});
}
</script>