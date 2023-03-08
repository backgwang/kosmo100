<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<article>
    <h3 class="sub_page_title">���� ����</h3>
    <form method="post" action="update">
        <input type="hidden" name="gnum" value="${dto.gnum}">
        <input type="hidden" name="gwriter" value="${sessionScope.id}">
        <table class="table1 type">
            <tr>
                <td>����</td>
                <td><input type="text" name="gsubject" class="input type1" placeholder="������ �Է��� �ּ���." value="${dto.gsubject}">
            </tr>
            <tr>
                <td>����</td>
                <td><textarea name="gcontent" rows="12" cols="100" class="textarea" placeholder="������ �Է��� �ּ���.">${dto.gcontent}</textarea></td>
            </tr>
        </table>
        <div class="bottom_btn_wrap txt-c">
            <button class="btn btn_primary btn_xs ml10" type="submit">����</button>
            <button class="btn btn_grey btn_xs" type="button" id="cancleBtn">���</button>
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