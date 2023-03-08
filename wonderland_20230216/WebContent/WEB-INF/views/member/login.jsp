<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="box_area login-box">
		<h3>�ȳ��ϼ���? ���� �ݰ����ϴ�.</h3>
		<form method="post" action="loginProcess" onsubmit="return frm_check()" id="loginForm">
			<div class="mt40">
				<input type="text" class="input_txt inp_l" placeholder="���̵� �Է��ϼ���" name="sid" id="sid">
				<input type="password" class="input_txt inp_l mt10" placeholder="��й�ȣ�� �Է��ϼ���." name="spwd" id="spwd">
			</div>
			<div id="target" class="error_message txt-c"></div>
			<ul class="flex mt20">
				<li class="checkbox"><input type="checkbox" name="checkId" id="saveId"> <label for="saveId">���̵� ����</label></li>
				<li class="txt-r mt10"><a href="searchidpwd" class="btn_arrow span"><span>���̵� �Ǵ� ��й�ȣ�� �����̳���?</span>
				</a></li>
			</ul>
			<div class="bottom_btn_wrap txt-c">
				<button class="btn btn_primary btn_s" type="button" id="loginBtn">�α���</button>
				<button class="btn btn_line btn_s mt10" type="button" id="joinBtn">ȸ������</button>
			</div>
		</form>
	</div>
</article>
<script>
$(function() {
	// ��Ű �����ϴ� �Լ�
	fnInit();
	
	// ȸ������ ��ư Ŭ�� �� ������ �̵�
	$('#joinBtn').click(function() {
		location = "join";
	});
	
	// �α��� ��ư Ŭ�� �� ajax �Լ� ����
	$('#loginBtn').click(function() {
		submitCheck();
	});
	
	// ���� Ŭ�� �� �α��� ��ư �Լ� ����
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

	if (document.cookie.length > 0) { // ��Ű�� �����Ǿ� �ִٸ� 
		offset = document.cookie.indexOf(search);
		console.log("offset : " + offset);
		if (offset != -1) { // ��Ű�� �����ϸ� 
			offset += search.length;
			// set index of beginning of value
			end = document.cookie.indexOf(";", offset);
			console.log("end : " + end);
			// ��Ű ���� ������ ��ġ �ε��� ��ȣ ���� 
			if (end == -1)
				end = document.cookie.length;
			console.log("end��ġ  : " + end);

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
				$('#target').html("���̵� �Ǵ� ��й�ȣ�� �� �� �Է��߽��ϴ�.<br> �Է��Ͻ� ������ �ٽ� Ȯ�����ּ���.");

			} else {
				$('#loginForm').submit();
			}
		}
	});
}
</script>