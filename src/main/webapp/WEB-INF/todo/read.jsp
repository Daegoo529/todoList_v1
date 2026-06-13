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
    <title>Todo Read</title>

</head>
<body>

<div class="read-container">
    <h2>할 일 상세 보기</h2>

    <div class="input-group">
        <label for="tno">등록 번호</label>
        <input type="text" id="tno" name="tno" value="${dto.tno}" readonly>
    </div>

    <div class="input-group">
        <label for="title">할 일 제목</label>
        <input type="text" id="title" name="title" value="${dto.title}" readonly>
    </div>

    <div class="input-group">
        <label for="dueDate">마감 기한</label>
        <input type="date" id="dueDate" name="dueDate" value="${dto.dueDate}" readonly style="cursor: not-allowed;">
    </div>

    <div class="checkbox-group">
        <input type="checkbox" id="finished" name="finished" ${dto.finished ? "checked": ""} readonly onclick="return false;">
        <label for="finished">완료 여부 (DONE)</label>
    </div>

    <div class="btn-group">
        <a href="/todo/modify?tno=${dto.tno}" class="btn-modify">Modify/Remove</a>
        <a href="/todo/list" class="btn-list">List</a>
    </div>
</div>

</body>
</html>