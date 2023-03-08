<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="sect-top">
    	<h3 class="sub_page_title">나의 문의 내역</h3>
    	<p>사이트 이용 시 궁금하신 사항이 있으시면 문의를 남겨 주세요.</p>
	</div>
	<div class="sect-cont">
	    <table class="table1">
	        <colgroup>
	            <col width="10%">
	            <col width="40%">
	            <col width="20%">
	        </colgroup>
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>날짜</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%--반복시작 --%>
	            <c:forEach var="e" items="${list}">
	                <tr>
	                    <td>${e.gnum}</td>
	                    <td><a href="detail?gnum=${e.gnum}">${e.gsubject}</a></td>
	                    <td>${e.gdate}</td>
	                </tr>
	            </c:forEach>
	            <%--반복시끝 --%>
	        </tbody>
	    </table>
	    <div class="bottom_btn_wrap txt-r">
	        <button class="btn btn_primary btn_xs" type="button" id="wbtn">등록하기</button>
	    </div>
	</div>
</article>
<script>
    $(function() {
        $('#wbtn').click(function() {
            location = "form";
        });
    });
</script>