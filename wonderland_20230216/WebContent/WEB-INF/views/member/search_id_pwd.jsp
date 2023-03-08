<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<article>
	<section class="sect01">
		<div class="inner">
			<h3 class="sub_page_title">���̵�/��й�ȣ ã��</h3>
			<div class="tab_box">
				<!-- tabs -->
				<nav class="tabs">
					<button type="button" class="tab-link on" data-tab="tab-1">���̵� ã��</button>
					<button type="button" class="tab-link" data-tab="tab-2">��й�ȣ ã��</button>
				</nav>
				<!-- //tabs -->
				<!-- content -->
				<ul class="tabs_content">
					<!-- ���̵� ã�� -->
					<li id="tab-1" class="on">
					<form method="post" action="findId">
						<table class="table1 type">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td>�̸�</td>
								<td>
									<input type="text" id="sname" name="sname" class="input_txt inp_m type1" placeholder="�̸��� �Է��� �ּ���.">
								</td>
							</tr>
							<tr>
								<td>�̸���</td>
								<td>
									<input type="text" id="semail" name="semail" class="input_txt inp_m type1" placeholder="�̸����� �Է��� �ּ���.">
								</td>
							</tr>
						</table>
						<div class="bottom_btn_wrap txt-c">
							<button type="submit" class="btn btn_primary btn_xs">ã��</button>
						</div>
						</form>
					</li>
					<!-- ��й�ȣ ã�� -->
					<li id="tab-2">
					<form method="post" action="newPwd">
						<table class="table1 type">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td>���̵�</td>
								<td><input type="text" name="sid" class="input_txt inp_m type1" placeholder="���̵� �Է��� �ּ���."></td>
							</tr>
							<tr>
								<td>�̸�</td>
								<td><input type="text" name="sname" class="input_txt inp_m type1" placeholder="�̸��� �Է��� �ּ���."></td>
							</tr>
							<tr>
                                <td>�̸���</td>
                                <td>
                                    <input type="text" name="semail" id="email" class="input_txt inp_m type1" placeholder="�̸����� �Է��� �ּ���.">
                                    &nbsp;<button type="button" id="sendEmailBtn" class="btn btn_primary btn_xxs">������ȣ �߼�</button>
                                    <div id="emailTarget"></div>
                                </td>
                            </tr>
							<tr>
								<td>������ȣ</td>
								<td>
									<input type="hidden" id="certnum" value="${certnum}">
									<input type="text" id="num" class="input_txt inp_m type1">
									&nbsp;<button type="button" id="certBtn" class="btn btn_primary btn_xxs">�����ϱ�</button>
									<div id="target"></div>
								</td>
							</tr>
						</table>
						<div class="bottom_btn_wrap txt-c" id="btnTarget">
							<!-- <button type="submit" class="btn btn_primary btn_xs">ã��</button> -->
						</div>
						</form>
					</li>
					<!-- //SMS -->
				</ul>
				<!-- //content -->
			</div>
		</div>
	</section>
</article>
<script>
$(function(){
	// Tabs
	$(".tab_box .tabs button").click(function() {
		var tab_id = $(this).attr('data-tab');
		$(".tab_box .tabs button").removeClass('on');
		$(".tab_box .tabs_content > li").removeClass('on');
		$(this).addClass('on');
		$("#" + tab_id).addClass('on');
	});

	$('#sendEmailBtn').click(function() {
		$('#emailTarget').html('<span style="color:blue">������ȣ�� ���۵Ǿ����ϴ�. �̸����� Ȯ�����ּ���.</span>');
		let $email = $('#email').val();
        $.ajax({
            url:"../sendEmail?email=" + $email,
            success:function(data){
                $('#certnum').val(data);
            }
        });
    });

	$('#certBtn').click(function(){
		let certnum = $('#certnum').val();
		let num = $('#num').val();
		$.ajax({
			url:"../certCheck?num=" + num + "&certnum=" + certnum,
			success:function(data){
				if (data == 1) {
					$('#target').css('background-color','red').css('color','black').html('�̸����� �������ּ���.');
				} else if (data == 2) {
					$('#target').css('background-color','orange').css('color','black').html('������ȣ�� �Է����� �ʾҽ��ϴ�.');
				} else if (data == 3) {
					$('#target').css('background-color','yellow').css('color','black').html('������ȣ�� ����ġ�մϴ�.');
				} else if (data == 4) {
					$('#target').css('background-color','green').css('color','white').html('���� ����!');
					$('#btnTarget').html("<button type='submit' class='btn btn_primary btn_xs'>ã��</button>");
				}
			}
		});
	});
})
</script>