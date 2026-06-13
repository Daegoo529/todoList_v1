<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2025-10-24
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- JSTL c:if 태그 사용을 위해 코어 태그 라이브러리를 상단에 추가했습니다 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
    <style>
        /* 기본 스타일 리셋 및 배경 설정 */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 로그인 카드 컨테이너 */
        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(149, 157, 165, 0.15);
            width: 100%;
            max-width: 380px;
        }

        /* 서비스 타이틀 */
        .login-title {
            font-size: 24px;
            font-weight: 700;
            color: #4a90e2;
            text-align: center;
            margin-bottom: 8px;
        }

        .login-subtitle {
            font-size: 14px;
            color: #868e96;
            text-align: center;
            margin-bottom: 24px;
        }

        /* 에러 메시지 상자 스타일 */
        .error-box {
            background-color: #fff5f5;
            border: 1px solid #ffe3e3;
            color: #e03131;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 500;
        }

        /* 입력 폼 그룹 */
        .input-group {
            margin-bottom: 16px;
        }

        .input-group input {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: all 0.3s ease;
            color: #333333;
        }

        /* 포커스 효과 */
        .input-group input:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
        }

        /* 로그인 버튼 스타일 */
        .btn-login {
            width: 100%;
            padding: 14px;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }

        .btn-login:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-title">Todo 서비스</div>
    <div class="login-subtitle">로그인 후 간편하게 할 일을 관리하세요</div>

    <%-- class="test" 속성을 제거하여 오류를 해결했습니다 --%>
    <c:if test="${param.result == 'error'}">
        <div class="error-box">
            ⚠️ 아이디 또는 비밀번호를 확인해주세요.
        </div>
    </c:if>

    <%-- 기능이 그대로 유지된 로그인 폼 --%>
    <form action="/login" method="post" style="margin: 0;">
        <div class="input-group">
            <input type="text" name="mid" placeholder="아이디를 입력하세요" required>
        </div>
        <div class="input-group">
            <input type="text" name="mpw" placeholder="비밀번호를 입력하세요" required>
        </div>
        <button type="submit" class="btn-login">LOGIN</button>
    </form>
</div>
</body>
</html>