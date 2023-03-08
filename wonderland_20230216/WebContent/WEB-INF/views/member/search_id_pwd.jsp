<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<article>
	<section class="sect01">
		<div class="inner">
			<h3 class="sub_page_title">아이디/비밀번호 찾기</h3>
			<div class="tab_box">
				<!-- tabs -->
				<nav class="tabs">
					<button type="button" class="tab-link on" data-tab="tab-1">아이디 찾기</button>
					<button type="button" class="tab-link" data-tab="tab-2">비밀번호 찾기</button>
				</nav>
				<!-- //tabs -->
				<!-- content -->
				<ul class="tabs_content">
					<!-- 아이디 찾기 -->
					<li id="tab-1" class="on">
					<form method="post" action="findId">
						<table class="table1 type">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" id="sname" name="sname" class="input_txt inp_m type1" placeholder="이름을 입력해 주세요.">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" id="semail" name="semail" class="input_txt inp_m type1" placeholder="이메일을 입력해 주세요.">
								</td>
							</tr>
						</table>
						<div class="bottom_btn_wrap txt-c">
							<button type="submit" class="btn btn_primary btn_xs">찾기</button>
						</div>
						</form>
					</li>
					<!-- 비밀번호 찾기 -->
					<li id="tab-2">
					<form method="post" action="newPwd">
						<table class="table1 type">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="sid" class="input_txt inp_m type1" placeholder="아이디를 입력해 주세요."></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="sname" class="input_txt inp_m type1" placeholder="이름을 입력해 주세요."></td>
							</tr>
							<tr>
                                <td>이메일</td>
                                <td>
                                    <input type="text" name="semail" id="email" class="input_txt inp_m type1" placeholder="이메일을 입력해 주세요.">
                                    &nbsp;<button type="button" id="sendEmailBtn" class="btn btn_primary btn_xxs">인증번호 발송</button>
                                    <div id="emailTarget"></div>
                                </td>
                            </tr>
							<tr>
								<td>인증번호</td>
								<td>
									<input type="hidden" id="certnum" value="${certnum}">
									<input type="text" id="num" class="input_txt inp_m type1">
									&nbsp;<button type="button" id="certBtn" class="btn btn_primary btn_xxs">인증하기</button>
									<div id="target"></div>
								</td>
							</tr>
						</table>
						<div class="bottom_btn_wrap txt-c" id="btnTarget">
							<!-- <button type="submit" class="btn btn_primary btn_xs">찾기</button> -->
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
		$('#emailTarget').html('<span style="color:blue">인증번호가 전송되었습니다. 이메일을 확인해주세요.</span>');
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
					$('#target').css('background-color','red').css('color','black').html('이메일을 인증해주세요.');
				} else if (data == 2) {
					$('#target').css('background-color','orange').css('color','black').html('인증번호를 입력하지 않았습니다.');
				} else if (data == 3) {
					$('#target').css('background-color','yellow').css('color','black').html('인증번호와 불일치합니다.');
				} else if (data == 4) {
					$('#target').css('background-color','green').css('color','white').html('인증 성공!');
					$('#btnTarget').html("<button type='submit' class='btn btn_primary btn_xs'>찾기</button>");
				}
			}
		});
	});
})
</script>