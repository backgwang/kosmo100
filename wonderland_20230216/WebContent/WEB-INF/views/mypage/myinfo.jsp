<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
.ico_guide {display: block;}
.guide_con.row {margin: 0 0 20px;padding: 20px 0 15px 160px;min-height: 150px;font-size: 17px;color: #747474;text-align: left;line-height: 1.5;position: relative;}
.guide_con.row.bg {background: #e6e6e6;border-radius: 5px;-webkit-radius: 5px;-moz-radius: 5px;}
.guide_con.row.ico5 .ico_guide {background-position: -520px 0;}
.guide_con.row .ico_guide {position: absolute;left: 20px;top: 8%;width: 130px;height: 130px;}
.leftpp50 {width: 50%;float: left;box-sizing: border-box;}
.rightpp50 {width: 50%;float: right;box-sizing: border-box;}
.rightpp30 {width: 40%;float: right;box-sizing: border-box;}
.mymybtn {padding: 8px 20px;text-align: center;}
</style>
<div class="sect">
	<div class="part">
		<aside>
			<ul class="lnb-tabs">
				<li class="lnb-item"><a class="nav-link active" data-toggle="tab" href="#tab-1" data-bs-target="#tab-1">내 정보</a></li>
				<li class="lnb-item"><a class="nav-link" data-toggle="tab" href="#tab-2" data-bs-target="#tab-2">내 강의</a></li>
				<li class="lnb-item"><a class="nav-link" data-toggle="tab" href="#tab-3" data-bs-target="#tab-3">내 스터디</a></li>
			</ul>
		</aside>
		<article>
			<div class="tab-content">
				<div class="tab-pane"></div>
			</div>
			<div class="sect-top">
				<h3 class="sub_page_title">내 정보</h3>
				<p class="sub_page_stitle"><span class="rblue">${dto.sname}</span>&nbsp;님의 회원 정보 입니다.</p>
				<table class="table1">
					<tr>
						<th>이름</th>
						<td>${dto.sname}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${dto.sid}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${dto.semail}</td>
					</tr>
					<tr>
						<th>가입 날짜</th>
						<td>${dto.regdate}</td>
					</tr>
					<tr>
						<th>이번달 출석일</th>
						<td>${dto.cnt}</td>
					</tr>
				</table>
				<div class="bottom_btn_wrap">
					<button type="button" class="btn btn_primary">회원 정보 수정</button>
					<button type="button" class="btn btn_outline_primary">회원 탈퇴</button>
				</div>
			</div>
			<div class="sect-cont">
				<div class="part">
					<div class="calender">
						<img src="${pageContext.request.contextPath}/resources/images/table.png" style="width: 500px; height: 350px;">
					</div>
					<div id="chart" class="chart">
					
					</div>
				</div>
			</div>
		</article>
	</div>
</div>
<script>
	let jsondata = {}
	jsondata.출석 = ${dto.cnt};
	jsondata.미출석 = 30 - jsondata.출석;
	
	var chart = c3.generate({
		data : {
			json : [ jsondata ],
			keys : {
				value : Object.keys(jsondata),
			},

			type : 'donut',
		},
		color : {
			pattern : [ '#1f77b4', '#fafafa' ],
		},

		donut : {
			title : '출석률'
		}, size: {
			width: 400,
			height: 400
			
		}
	});
</script>
