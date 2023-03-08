<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<article>
	<section class="sect01">
		<div class="inner">
			<h3 class="sub_page_title">새비밀번호 변경</h3>
			<form method="post" action="updatePwd">
			<input type="hidden" name="sid" value="${dto.sid}">
			<input type="hidden" name="sname" value="${dto.sname}">
			<input type="hidden" name="semail" value="${dto.semail}">
			<div class="tab_box">
				<!-- tabs -->
				<nav class="tabs">
					<button type="button" class="tab-link on" data-tab="tab-1">비밀번호 변경</button>
				</nav>
				<!-- //tabs -->
				<!-- content -->
				<ul class="tabs_content">
					<!-- 새 비밀번호 변경 -->
					<li id="tab-1" class="on">
						<table class="table1 type">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td>새 비밀번호</td>
								<td>
									<input type="text" id="spwd" name="spwd" class="input_txt inp_m type" placeholder="새로운 비밀번호를 입력해 주세요.">
								</td>
							</tr>
							<tr>
								<td>새 비밀번호 확인</td>
								<td>
									<input type="text" id="spwd1" name="spwd1" class="input_txt inp_m type" placeholder="새로운 비밀번호를 다시 한번 입력해 주세요.">
								</td>
							</tr>
						</table>
						<div class="bottom_btn_wrap txt-c">
							<button type="submit" class="btn btn_primary btn_xs">변경</button>
						</div>
					</li>

					<!-- //SMS -->
				</ul>
				<!-- //content -->
			</div>
			</form>
		</div>
	</section>
</article>		

<script>
	// Tabs
	$(".tab_box .tabs button").click(function() {
		var tab_id = $(this).attr('data-tab');
		$(".tab_box .tabs button").removeClass('on');
		$(".tab_box .tabs_content > li").removeClass('on');
		$(this).addClass('on');
		$("#" + tab_id).addClass('on');
	})
</script>