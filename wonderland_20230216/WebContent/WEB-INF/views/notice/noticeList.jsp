<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
	<div class="sect-top">
		<h3 class="sub_page_title">공지사항</h3>
		<div class="flex">
			<ul class="srch_area">
				<li>
					<select id="dataPerPage" class="form-select" >
						<option value="10">10개씩보기</option>
						<option value="15">15개씩보기</option>
						<option value="20">20개씩보기</option>
					</select>
				</li>
				<li id="displayCount" class="ml10"></li>
			</ul>
			<ul class="srch_area">
				<li>
					<select class="select" name="searchType" id="searchType">
						<option selected value="1">제목</option>
						<option value="2">내용</option>
					</select>
				</li>
				<li class="ml10"><input type="text" class="input" id="searchValue" name="searchValue" placeholder="검색어 입력" style="width: 300px;"></li>
				<li class="ml10"><button class="btn btn_primary btn_xs" type="submit">검색</button></li>
			</ul>
		</div>
	</div>
	<table id="dataTableBody" class="table1 table2 table-l"></table>
	<nav aria-label="Page navigation">
		<ul id="pagingul" class="pagination justify-content-center"></ul>
	</nav>
</article>
<script>
$(function() {
	$('#wbtn').click(function(){
		location = "form";
	});
});

let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let dataList; //표시하려하는 데이터 리스트

$(document).ready(function () {
	 //dataPerPage 선택값 가져오기
	 dataPerPage = $("#dataPerPage").val();
	 
	 $.ajax({ // ajax로 데이터 가져오기
		 method: "GET",
		 url: "../ajaxNoticeList",
		 dataType: "json",
		 success: function (d){ 
			//console.log(d); 데이터 잘 넘어왔는지 확인 완료
		
			//totalData(총 데이터 수) 구하기
			totalData = d.length;
			//데이터 대입
			dataList=d;
			//console.log(totalData);
			//console.log(dataList);
			//글 목록 표시 호출 (테이블 생성)
			displayData(1, dataPerPage);
	           
			//페이징 표시 호출
			paging(totalData, dataPerPage, pageCount, 1);
		}
	});
	
});
	
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
	let chartHtml = "";
	chartHtml += "<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th></tr>";
	for(var i = 0 ; i < dataList.length; i++){
		if(dataList[i].nfix == 'Y'){
			chartHtml += "<tr class='fixed'>"
					+    "<td><div class='i-tag'><span>공지</span></div></td>"
					+    "<td class='txt-l'><a href='detail?nnum=" + dataList[i].nnum + "'>"+ dataList[i].nsubject + "</a></td>"
					+    "<td>" + dataList[i].nwriter + "</td>"
					+    "<td>" + dataList[i].ndate + "</td>"
					+    "<td><i class='bi bi-eye'></i>&nbsp;" + dataList[i].ncount + "</td>"
					+    "</tr>";
		}
	}

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	   
	var startNum = (currentPage - 1) * dataPerPage;
	var endNum = (currentPage - 1) * dataPerPage + dataPerPage;

	for ( var i = startNum ; i < endNum; i++ ) {
		if(dataList[i] != null){
			chartHtml += "<tr>"
					+    "<td>" + dataList[i].nnum + "</td>"
					+    "<td class='txt-l'><a href='detail?nnum=" + dataList[i].nnum + "'>"+ dataList[i].nsubject + "</a></td>"
					+    "<td>" + dataList[i].nwriter + "</td>"
					+    "<td>" + dataList[i].ndate + "</td>"
					+    "<td><i class='bi bi-eye'></i>&nbsp;" + dataList[i].ncount + "</td>"
					+ 	 "</tr>";
			}
		  
	    } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
	$("#dataTableBody").html(chartHtml); 
}
	
function paging(totalData, dataPerPage, pageCount, currentPage) {
	//console.log("currentPage : " + currentPage); 현재 페이지 확인

	totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	if(totalPage<pageCount){
		pageCount=totalPage;
	}
	  
	let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	if (last > totalPage) {
		last = totalPage;
	}

	let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	let next = last + 1;
	let prev = first - 1;

	let pageHtml = "";

	if (prev > 0) {
		pageHtml += '<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	}

	//페이징 번호 표시 
	for (var i = first; i <= last; i++) {
		if (currentPage == i) {
			pageHtml += "<li class='page-item active'><a href='#' class='page-link' id='" + i + "'>" + i + "</a></li>";
		} else {
			pageHtml += "<li class='page-item'><a href='#' class='page-link' id='" + i + "'>" + i + "</a></li>";
		}
	}

	if (last < totalPage) {
		pageHtml += '<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>';;
	}

	$("#pagingul").html(pageHtml);
	let displayCount = "";
	displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	$("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	$("#pagingul li a").click(function () {
		let $id = $(this).attr("id");
	    selectedPage = $(this).text();
	   
	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;

	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	  
	    //글 목록 표시 재호출
		//console.log(selectedPage); //2
		//console.log(dataPerPage); //10
	    
	    displayData(selectedPage, dataPerPage);
	    
	});
}
	
$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });
</script>