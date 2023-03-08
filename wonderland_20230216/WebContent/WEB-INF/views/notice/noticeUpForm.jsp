<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<h3 class="sub_page_title">공지 수정</h3>
	<form method="post" action="update">
		<input type="hidden" name="nnum" value="${dto.nnum}">
		<table class="table1 type">
			<colgroup>
				<col width="15%">
				<col width="85%">
			</colgroup>
			<tr>
				<td class="txt-c">제목</td>
				<td><input type="text" name="nsubject" class="input type1"
					placeholder="제목을 입력하세요." value="${dto.nsubject}" /></td>
			</tr>
			<tr>
				<td class="txt-c">고정글 여부</td>
				<%--
                <c:choose>
                    <c:when test="${dto.nfix == 'y'}">
                        <td><input type="radio" name="nfix" value="y" checked="checked">&nbsp;예&nbsp;&nbsp;<input type="radio" name="nfix" value="n">&nbsp;아니오</td>
                    </c:when>
                    <c:otherwise>
                        <td><input type="radio" name="nfix" value="y">&nbsp;예&nbsp;&nbsp;<input type="radio" name="nfix" value="n" checked="checked">&nbsp;아니오</td>
                    </c:otherwise>
                </c:choose> --%>
				<td><input type="radio" name="nfix" value="Y">&nbsp;예&nbsp;&nbsp;<input
					type="radio" name="nfix" value="N">&nbsp;아니오</td>
			</tr>
			<tr>
				<td class="align-text-bottom txt-c">내용</td>
				<td><textarea name="ncontent" id="ncontent" class="textarea"
						rows="5">${dto.ncontent}</textarea></td>
			</tr>
		</table>
		<div class="bottom_btn_wrap txt-r">
			<button class="btn btn_grey btn-xs" type="button" id="cancleBtn">취소</button>
			<button class="btn btn_primary btn-xs ml10" type="submit">수정</button>
		</div>
	</form>
</article>
<script>
    $(function() {
        $('#cancleBtn').click(function() {
            location = "detail?nnum=" + ${dto.nnum};
        });
        if(${dto.nfix == 'Y'}){
            $("input[value='Y']").prop('checked',true);
        } else if(${dto.nfix == 'N'}){
            $("input[value='N']").prop('checked',true);
        }
		
    	
    });
</script>