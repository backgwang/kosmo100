<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Start! --%>
<c:set var="pageurl" value="list?searchType=${page.searchType}&searchValue=${page.searchValue}&cPage" />
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${page.startPage <= page.pagePerBlock}">
				<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="${pageurl}=${page.startPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach varStatus="i" begin="${page.startPage}" end="${page.endPage}" step="1">
			<c:choose>
				<c:when test="${i.index == page.nowPage}">
					<li class="page-item active">
						<a class="page-link" href="#">${i.index}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageurl}=${i.index}">${i.index}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${page.endPage >= page.totalPage}">
				<li class="page-item disabled"><a class="page-link" href="${pageurl}=${page.nowPage + 1}">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="${pageurl}=${page.endPage + 1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<%-- End ! --%>