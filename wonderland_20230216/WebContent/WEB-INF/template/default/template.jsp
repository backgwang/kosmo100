<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Wonderland</title>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/moon-stars-fill.png">
<!-- CSS 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wonderland2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wonderland.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/c3.css">
<!-- JS 파일 -->
<script src="${pageContext.request.contextPath}/resources/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/c3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<%-- header 영역 시작 --%>
<body id="wrap">
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="quick"/>
	<%-- header 영역 끝 --%>
<%-- content 영역 시작 --%>
		<%-- (aside), article, body 영역 시작 --%>
		<tiles:insertAttribute name="webbody"/>
		<%-- (aside), article, body 영역 끝 --%>
<%-- content 영역 끝 --%>
<%-- footer 영역 시작 --%>
	<tiles:insertAttribute name="footer"/>
<%-- footer 영역 끝 --%>
</html>