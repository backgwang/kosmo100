<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<article>
    <h3 class="sub_page_title">문의 수정</h3>
    <form method="post" action="update">
        <input type="hidden" name="gnum" value="${dto.gnum}">
        <input type="hidden" name="gwriter" value="${sessionScope.id}">
        <table class="table1 type">
            <tr>
                <td>제목</td>
                <td><input type="text" name="gsubject" class="input type1" placeholder="제목을 입력해 주세요." value="${dto.gsubject}">
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="gcontent" rows="12" cols="100" class="textarea" placeholder="내용을 입력해 주세요.">${dto.gcontent}</textarea></td>
            </tr>
        </table>
        <div class="bottom_btn_wrap txt-c">
            <button class="btn btn_primary btn_xs ml10" type="submit">수정</button>
            <button class="btn btn_grey btn_xs" type="button" id="cancleBtn">취소</button>
        </div>
    </form>
</article>
<script>
    $(function() {
        $('#cancleBtn').click(function() {
            location = "detail?gnum=" + ${dto.gnum};
        });
    });
</script>