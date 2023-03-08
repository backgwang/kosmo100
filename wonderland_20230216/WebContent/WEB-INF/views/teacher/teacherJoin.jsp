<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<article>
	<h3 class="sub_page_title">선생가입</h3>
	<div class="agree_terms">
		<form method="post" action="add" enctype="multipart/form-data">
			<table class="table1 type">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>아이디 <span class="red">*</span></td>
					<td>
						<input type="text" name="tid" id="tid" class="input_txt inp_m type1" maxlength="13" placeholder="아이디를 입력해 주세요." required="required">
						<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="tidC" name="tidC">중복확인</button>
						<span id="tidtarget"></span>
						<p class="tb_txt_S">
							<span class="red">*</span>영문, 숫자 모두 포함 최소 6자~13자
						</p>
					</td>
				</tr>
				<tr>
					<td>비밀번호 <span class="red">*</span></td>
					<td><input type="password" name="tpwd" id="tpwd" maxlength="20" class="input_txt inp_m type1" placeholder="비밀번호를 입력해 주세요." required="required">
					<span id="tpwdtarget"></span>
						<p class="tb_txt_S">
							<span class="red">*</span> 영문, 숫자 모두 포함 최소 10자~20자
						</p></td>
				</tr>
				<tr>
					<td>비밀번호 확인<span class="red">*</span></td>
					<td>
						<input type="password" name="tpwd2" id="tpwd2" maxlength="20" class="input_txt inp_m type1" placeholder="비밀번호를 다시 입력해 주세요." required="required">
					</td>
				</tr>
				<tr>
					<td>이름<span class="red">*</span></td>
					<td><input type="text" name="tname" id="tname" class="input_txt inp_m type1" placeholder="이름 입력해 주세요." required="required"></td>
				</tr>
				<tr>
					<td>생년월일<span class="red">*</span></td>
					<td>
						<input type="text" name="tbday1" id="tbday1" style="width: 100px;" maxlength="6" class="input_txt inp_m type1" placeholder="YYMMDD" required
						 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - 
						 <input type="text" name="tbday2" id="tbday2" style="width: 30px;" maxlength="1" class="input_txt inp_m type1" placeholder="0" required
						 oninput="this.value = this.value.replace(/[^1-4.]/g, '').replace(/(\..*)\./g, '$1');">  
						<p><span class="red">*</span> 주민등록번호 7자리를 입력해주세요</p>
						<span id="tbdaytarget"></span>
					</td>
				</tr>
				<tr>
					<td>이메일 주소<span class="red">*</span></td>
					<td><input type="text" name="temail" id="temail" class="input_txt inp_m type1" placeholder="E-mail  @  입력해주세요." style="width: 500px" required="required">
						<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="temailC" name="temailC">이메일확인</button>
						<span id="temailtarget" class="ml5"></span></td>
				</tr>
				<tr>
					<td>소개란</td>
					<td><textarea rows="6" class="textarea" name="tinfo" id="tinfo" placeholder="소개. 200자 이내로 작성"></textarea></td>
				</tr>
				<tr>
					<td>선생님 이미지</td>
					<td>
						<input type="file" name="mfile" id="mfile" />
						<div class="col-sm-10">
							<img src="${pageContext.request.contextPath }/resources/images/no_img.png" id="imgx">
						</div>
					</td>
				</tr>
			</table>
			<div class="bottom_btn_wrap txt-c">
				<button class="btn btn_grey btn_xs" type="button" id="cancleBtn">취소</button>
				<button class="btn btn_primary btn_xs ml10" type="submit">가입</button>
			</div>
		</form>
	</div>
</article>
<script>
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgx').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$(function() {
	$('#cancleBtn').click(function(){
		location = "list";
	})
	
	$('#mfile').change(function() {
		if ($(this).val().length > 0) {
			readURL(this);
		}
	});

	$('#cancleBtn').click(function() {
		location = "../";
	});

	$('#tidC').click(function() {
		let idv = $('#tid').val();
		if (idv.length < 6 && idv.length > 13) {
			$('#tidtarget').html('너무 짧습니다..');
			$('#tidtarget').css('color', 'red');
		} else if(idv.length > 13){
			$('#tidtarget').html('너무 길어요..');
			$('#tidtarget').css('color', 'red');
		} else if(idv.length === 0){
			$('#tidtarget').html('아이디를 입력 해 주세요');
			$('#tidtarget').css('color', 'red');
		} else {
			$.ajax({
				url : '../tidChk?tid=' + idv,
				success : function(data) {
					if (data == 1) {
						$('#tidtarget').html('중복되는 아이디입니다.');
						$('#tidtarget').css('color', 'red');
					} else {
						$('#tidtarget').html('사용 가능한 아이디입니다.');
						$('#tidtarget').css('color', 'blue');
					}
				}
			});
		}
	});
	$('#tpwd').keyup(function() {
			$('#chkNotice').html('');
		});

		$('#tpwd2').keyup(function() {
			if ($('#tpwd').val() != $('#tpwd2').val()) {
				$('#chkNotice').html('비밀번호 일치하지 않음');
				$('#chkNotice').css('color', 'red');
			} else {
				$('#chkNotice').html('비밀번호 일치');
				$('#chkNotice').css('color', 'blue');
			}
		});
	$('#tbday1').keyup(function() {
		if($('#tbday1').val().length == 6){
			$('#tbdaytarget').html("주민등록번호 뒤 1자리");
			$('#tbdaytarget').css('color', 'red');
			$('#tbday2').focus();
		} else {
			$('#tbdaytarget').html("주민등록번호 6자리");
			$('#tbdaytarget').css('color', 'red');
		}
	});
	
	$('#tbday2').keyup(function() {
		if($('#tbday2').val()>0 && $('#tbday2').val() < 5){
			$('#tbdaytarget').html("O");
			$('#tbdaytarget').css('color', 'blue');
		}else{
			$('#tbdaytarget').html("올바르게 입력해주세요");
			$('#tbdaytarget').css('color', 'red');
		}
	});
	$('#temailC').click(function() {
		var emailv = $('#temail').val();
		if (emailv === "") {
		} else {
			$.ajax({
				url : '../temailChk?temail=' + emailv,
				success : function(data) {
					if (data === 1) {
						$('#temailtarget').html('사용중인 이메일 입니다.');
						$('#temailtarget').css('color', 'red');
					} else {
						$('#temailtarget').html('사용 가능한 이메일 입니다.');
						$('#temailtarget').css('color', 'blue');
					}
				}
			});
		}
	});
});
</script>