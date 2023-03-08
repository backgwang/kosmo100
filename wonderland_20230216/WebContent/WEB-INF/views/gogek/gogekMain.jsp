<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sect">
    <aside class="lnb_wrap">
        <ul class="lnb_depth1">
            <li>
                <button type="button" class="dep01" id="aBtn">공지사항</button>
                <button type="button" class="dep01" id="bBtn">1:1문의사항</button>
                <button type="button" class="dep01" id="cBtn">회사위치</button>
            </li>
        </ul>
    </aside>
</div>
<script>
    $("#aBtn").click(function(){
        location = "main";
    });
    $("#bBtn").click(function() {
        location = "form";
    })
    $("#cBtn").click(function() {
        location = "";
    })
</script>