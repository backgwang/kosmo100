<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<article>
    <h3 class="sub_page_title">1:1 문의</h3>
    <form method="post" action="add" id="gogek">
        <input type="hidden" name="gwriter" value="${sessionScope.id}">
        <table class="table1 type">
            <tr>
                <td>제목</td>
                <td><input type="text" name="gsubject" class="input type1" placeholder="제목을 입력해 주세요.">
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="gcontent" rows="12" cols="100" class="textarea" placeholder="내용을 입력해 주세요."></textarea></td>
            </tr>
        </table>
        <div class="bottom_btn_wrap txt-c">
            <button class="btn btn_grey btn_xs" type="button" id="cancleBtn">취소</button>
            <button class="btn btn_primary btn_xs ml10" type="submit">등록</button>
        </div>
    </form>
</article>
<script>
    $(function() {
        $('#cancleBtn').click(function() {
            location = "list?gwriter=${sessionScope.id}";
        });
    });
</script>