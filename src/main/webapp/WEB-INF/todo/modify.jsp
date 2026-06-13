<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2025-10-23
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Todo Modify/Remove</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modify.css">

</head>
<body>

<div class="modify-container">
    <h2>할 일 수정 및 삭제</h2>

    <!-- 수정 폼 -->
    <form id="form1" action="/todo/modify" method="post">
        <div class="input-group">
            <label for="tno">등록 번호</label>
            <input type="text" id="tno" name="tno" value="${dto.tno}" readonly>
        </div>

        <div class="input-group">
            <label for="title">할 일 제목</label>
            <input type="text" id="title" name="title" value="${dto.title}">
        </div>

        <div class="input-group">
            <label for="dueDate">마감 기한</label>
            <input type="date" id="dueDate" name="dueDate" value="${dto.dueDate}">
        </div>

        <div class="checkbox-group">
            <input type="checkbox" id="finished" name="finished" ${dto.finished ? "checked": ""}>
            <label for="finished">완료 여부 (DONE)</label>
        </div>

        <div class="btn-container">
            <!-- 수정을 처리하는 버튼 -->
            <button type="submit" class="btn-modify">Modify</button>
    </form>

    <!-- 삭제 폼 (디자인 정렬을 위해 수정 폼 버튼 바로 옆에 배치) -->
    <form id="form2" action="/todo/remove" method="post" class="action-form" style="flex: 1; margin: 0;">
        <input type="hidden" name="tno" value="${dto.tno}" readonly>
        <button type="submit" class="btn-remove">Remove</button>
    </form>
</div> <!-- .btn-container 마감 -->

</div>

</body>
</html>