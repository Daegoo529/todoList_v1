<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Todo Register Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<div class="register-container">
    <h2>새 할 일 등록</h2>

    <form action="/todo/register" method="post">
        <div class="input-group">
            <label for="title">할 일 제목</label>
            <input type="text" id="title" name="title" placeholder="무엇을 해야 하나요?">
        </div>

        <div class="input-group">
            <label for="dueDate">마감 기한</label>
            <input type="date" id="dueDate" name="dueDate">
        </div>

        <div class="btn-group">
            <a href="/todo/list" class="btn-reset">취소</a>
            <button type="submit" class="btn-submit">등록</button>
        </div>
    </form>
</div>

</body>
</html>