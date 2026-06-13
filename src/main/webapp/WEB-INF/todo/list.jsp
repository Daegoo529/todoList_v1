<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2025-10-23
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Todo List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/list.css">
</head>
<body>

<div class="todo-container">

    <div class="header-section">
        <div class="user-info">
            <span style="display:none;">${loginInfo}</span>
            <strong>${loginInfo.mname}</strong> 님 로그인 되셨습니다.
        </div>
        <form action="/logout" method="post" style="margin: 0;">
            <button class="btn-logout">LOGOUT</button>
        </form>
    </div>

    <div class="title-section">
        <div class="table-title">Todo List</div>
        <%-- 단순 div였던 추가 버튼을 등록 폼(/todo/register)으로 이동할 수 있는 버튼 링크로 다듬었습니다 --%>
        <a href="/todo/register" class="btn-register">추가</a>
    </div>

    <table>
        <thead>
        <tr>
            <th style="width: 10%;">No</th>
            <th style="width: 50%;">Title</th>
            <th style="width: 25%;">Due Date</th>
            <th style="width: 15%;">Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dtoList}" var="dto" varStatus="status">
            <tr>
                <td>${status.count}</td>

                <td style="text-align: left; padding-left: 20px;">
                    <a href="/todo/read?tno=${dto.tno}">${dto.title}</a>
                </td>

                <td>${dto.dueDate}</td>

                <td>
                    <c:choose>
                        <c:when test="${dto.finished}">
                            <span class="badge badge-done">DONE</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-yet">NOT YET</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>