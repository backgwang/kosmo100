<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
	<div class="sect-top">
		<h3 class="sub_page_title">��������</h3>
		<div class="flex">
			<ul class="srch_area">
				<li>
					<select id="dataPerPage" class="form-select" >
						<option value="10">10��������</option>
						<option value="15">15��������</option>
						<option value="20">20��������</option>
					</select>
				</li>
				<li id="displayCount" class="ml10"></li>
			</ul>
			<ul class="srch_area">
				<li>
					<select class="select" name="searchType" id="searchType">
						<option selected value="1">����</option>
						<option value="2">����</option>
					</select>
				</li>
				<li class="ml10"><input type="text" class="input" id="searchValue" name="searchValue" placeholder="�˻��� �Է�" style="width: 300px;"></li>
				<li class="ml10"><button class="btn btn_primary btn_xs" type="submit">�˻�</button></li>
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

let totalData; //�� ������ ��
let dataPerPage; //�� �������� ��Ÿ�� �� ��
let pageCount = 10; //����¡�� ��Ÿ�� ������ ��
let globalCurrentPage=1; //���� ������
let dataList; //ǥ���Ϸ��ϴ� ������ ����Ʈ

$(document).ready(function () {
	 //dataPerPage ���ð� ��������
	 dataPerPage = $("#dataPerPage").val();
	 
	 $.ajax({ // ajax�� ������ ��������
		 method: "GET",
		 url: "../ajaxNoticeList",
		 dataType: "json",
		 success: function (d){ 
			//console.log(d); ������ �� �Ѿ�Դ��� Ȯ�� �Ϸ�
		
			//totalData(�� ������ ��) ���ϱ�
			totalData = d.length;
			//������ ����
			dataList=d;
			//console.log(totalData);
			//console.log(dataList);
			//�� ��� ǥ�� ȣ�� (���̺� ����)
			displayData(1, dataPerPage);
	           
			//����¡ ǥ�� ȣ��
			paging(totalData, dataPerPage, pageCount, 1);
		}
	});
	
});
	
//���� ������(currentPage)�� �������� �� ����(dataPerPage) �ݿ�
function displayData(currentPage, dataPerPage) {
	let chartHtml = "";
	chartHtml += "<tr><th>��ȣ</th><th>����</th><th>�ۼ���</th><th>��¥</th><th>��ȸ��</th></tr>";
	for(var i = 0 ; i < dataList.length; i++){
		if(dataList[i].nfix == 'Y'){
			chartHtml += "<tr class='fixed'>"
					+    "<td><div class='i-tag'><span>����</span></div></td>"
					+    "<td class='txt-l'><a href='detail?nnum=" + dataList[i].nnum + "'>"+ dataList[i].nsubject + "</a></td>"
					+    "<td>" + dataList[i].nwriter + "</td>"
					+    "<td>" + dataList[i].ndate + "</td>"
					+    "<td><i class='bi bi-eye'></i>&nbsp;" + dataList[i].ncount + "</td>"
					+    "</tr>";
		}
	}

	//Number�� ��ȯ���� ������ �Ʒ����� +�� �� ��� ��Ʈ�� ������ �Ǿ����.. 
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
		  
	    } //dataList�� ������ ��������.. �� �ҽ��� �°� ������ �־��ָ� ��...
	$("#dataTableBody").html(chartHtml); 
}
	
function paging(totalData, dataPerPage, pageCount, currentPage) {
	//console.log("currentPage : " + currentPage); ���� ������ Ȯ��

	totalPage = Math.ceil(totalData / dataPerPage); //�� ������ ��
	  
	if(totalPage<pageCount){
		pageCount=totalPage;
	}
	  
	let pageGroup = Math.ceil(currentPage / pageCount); // ������ �׷�
	let last = pageGroup * pageCount; //ȭ�鿡 ������ ������ ������ ��ȣ
	  
	if (last > totalPage) {
		last = totalPage;
	}

	let first = last - (pageCount - 1); //ȭ�鿡 ������ ù��° ������ ��ȣ
	let next = last + 1;
	let prev = first - 1;

	let pageHtml = "";

	if (prev > 0) {
		pageHtml += '<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	}

	//����¡ ��ȣ ǥ�� 
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
	displayCount = "���� 1 - " + totalPage + " ������ / " + totalData + "��";
	$("#displayCount").text(displayCount);


	  //����¡ ��ȣ Ŭ�� �̺�Ʈ 
	$("#pagingul li a").click(function () {
		let $id = $(this).attr("id");
	    selectedPage = $(this).text();
	   
	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //���������� ������ ������ ��ȣ�� ��´�...
	    globalCurrentPage = selectedPage;

	    //����¡ ǥ�� ��ȣ��
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	  
	    //�� ��� ǥ�� ��ȣ��
		//console.log(selectedPage); //2
		//console.log(dataPerPage); //10
	    
	    displayData(selectedPage, dataPerPage);
	    
	});
}
	
$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //���� ������ ��� globalCurrent ���� �̿��Ͽ� ������ �̵����� �� ǥ�ð��� ���� 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });
</script>