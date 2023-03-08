<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="sect-top">
    	<h3 class="sub_page_title">���� ���� ����</h3>
    	<p>����Ʈ �̿� �� �ñ��Ͻ� ������ �����ø� ���Ǹ� ���� �ּ���.</p>
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
	                <th>��ȣ</th>
	                <th>����</th>
	                <th>��¥</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%--�ݺ����� --%>
	            <c:forEach var="e" items="${list}">
	                <tr>
	                    <td>${e.gnum}</td>
	                    <td><a href="detail?gnum=${e.gnum}">${e.gsubject}</a></td>
	                    <td>${e.gdate}</td>
	                </tr>
	            </c:forEach>
	            <%--�ݺ��ó� --%>
	        </tbody>
	    </table>
	    <div class="bottom_btn_wrap txt-r">
	        <button class="btn btn_primary btn_xs" type="button" id="wbtn">����ϱ�</button>
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