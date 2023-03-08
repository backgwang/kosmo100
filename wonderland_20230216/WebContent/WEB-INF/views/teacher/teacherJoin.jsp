<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<article>
	<h3 class="sub_page_title">��������</h3>
	<div class="agree_terms">
		<form method="post" action="add" enctype="multipart/form-data">
			<table class="table1 type">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>���̵� <span class="red">*</span></td>
					<td>
						<input type="text" name="tid" id="tid" class="input_txt inp_m type1" maxlength="13" placeholder="���̵� �Է��� �ּ���." required="required">
						<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="tidC" name="tidC">�ߺ�Ȯ��</button>
						<span id="tidtarget"></span>
						<p class="tb_txt_S">
							<span class="red">*</span>����, ���� ��� ���� �ּ� 6��~13��
						</p>
					</td>
				</tr>
				<tr>
					<td>��й�ȣ <span class="red">*</span></td>
					<td><input type="password" name="tpwd" id="tpwd" maxlength="20" class="input_txt inp_m type1" placeholder="��й�ȣ�� �Է��� �ּ���." required="required">
					<span id="tpwdtarget"></span>
						<p class="tb_txt_S">
							<span class="red">*</span> ����, ���� ��� ���� �ּ� 10��~20��
						</p></td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��<span class="red">*</span></td>
					<td>
						<input type="password" name="tpwd2" id="tpwd2" maxlength="20" class="input_txt inp_m type1" placeholder="��й�ȣ�� �ٽ� �Է��� �ּ���." required="required">
					</td>
				</tr>
				<tr>
					<td>�̸�<span class="red">*</span></td>
					<td><input type="text" name="tname" id="tname" class="input_txt inp_m type1" placeholder="�̸� �Է��� �ּ���." required="required"></td>
				</tr>
				<tr>
					<td>�������<span class="red">*</span></td>
					<td>
						<input type="text" name="tbday1" id="tbday1" style="width: 100px;" maxlength="6" class="input_txt inp_m type1" placeholder="YYMMDD" required
						 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - 
						 <input type="text" name="tbday2" id="tbday2" style="width: 30px;" maxlength="1" class="input_txt inp_m type1" placeholder="0" required
						 oninput="this.value = this.value.replace(/[^1-4.]/g, '').replace(/(\..*)\./g, '$1');">  
						<p><span class="red">*</span> �ֹε�Ϲ�ȣ 7�ڸ��� �Է����ּ���</p>
						<span id="tbdaytarget"></span>
					</td>
				</tr>
				<tr>
					<td>�̸��� �ּ�<span class="red">*</span></td>
					<td><input type="text" name="temail" id="temail" class="input_txt inp_m type1" placeholder="E-mail  @  �Է����ּ���." style="width: 500px" required="required">
						<button type="button" class="btn btn_primary btn_xxs ml5 mb2_3" id="temailC" name="temailC">�̸���Ȯ��</button>
						<span id="temailtarget" class="ml5"></span></td>
				</tr>
				<tr>
					<td>�Ұ���</td>
					<td><textarea rows="6" class="textarea" name="tinfo" id="tinfo" placeholder="�Ұ�. 200�� �̳��� �ۼ�"></textarea></td>
				</tr>
				<tr>
					<td>������ �̹���</td>
					<td>
						<input type="file" name="mfile" id="mfile" />
						<div class="col-sm-10">
							<img src="${pageContext.request.contextPath }/resources/images/no_img.png" id="imgx">
						</div>
					</td>
				</tr>
			</table>
			<div class="bottom_btn_wrap txt-c">
				<button class="btn btn_grey btn_xs" type="button" id="cancleBtn">���</button>
				<button class="btn btn_primary btn_xs ml10" type="submit">����</button>
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
			$('#tidtarget').html('�ʹ� ª���ϴ�..');
			$('#tidtarget').css('color', 'red');
		} else if(idv.length > 13){
			$('#tidtarget').html('�ʹ� ����..');
			$('#tidtarget').css('color', 'red');
		} else if(idv.length === 0){
			$('#tidtarget').html('���̵� �Է� �� �ּ���');
			$('#tidtarget').css('color', 'red');
		} else {
			$.ajax({
				url : '../tidChk?tid=' + idv,
				success : function(data) {
					if (data == 1) {
						$('#tidtarget').html('�ߺ��Ǵ� ���̵��Դϴ�.');
						$('#tidtarget').css('color', 'red');
					} else {
						$('#tidtarget').html('��� ������ ���̵��Դϴ�.');
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
				$('#chkNotice').html('��й�ȣ ��ġ���� ����');
				$('#chkNotice').css('color', 'red');
			} else {
				$('#chkNotice').html('��й�ȣ ��ġ');
				$('#chkNotice').css('color', 'blue');
			}
		});
	$('#tbday1').keyup(function() {
		if($('#tbday1').val().length == 6){
			$('#tbdaytarget').html("�ֹε�Ϲ�ȣ �� 1�ڸ�");
			$('#tbdaytarget').css('color', 'red');
			$('#tbday2').focus();
		} else {
			$('#tbdaytarget').html("�ֹε�Ϲ�ȣ 6�ڸ�");
			$('#tbdaytarget').css('color', 'red');
		}
	});
	
	$('#tbday2').keyup(function() {
		if($('#tbday2').val()>0 && $('#tbday2').val() < 5){
			$('#tbdaytarget').html("O");
			$('#tbdaytarget').css('color', 'blue');
		}else{
			$('#tbdaytarget').html("�ùٸ��� �Է����ּ���");
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
						$('#temailtarget').html('������� �̸��� �Դϴ�.');
						$('#temailtarget').css('color', 'red');
					} else {
						$('#temailtarget').html('��� ������ �̸��� �Դϴ�.');
						$('#temailtarget').css('color', 'blue');
					}
				}
			});
		}
	});
});
</script>