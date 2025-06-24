<%-- webapp/WEB-INF/todo/todoUpd.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> <%-- 한글 깨짐 방지를 위한 메타 태그 --%>
    <title>할 일 수정</title>
    <%--
        여기에 `<style>` 태그와 그 안에 있던 모든 CSS 코드가 제거되었습니다.
        만약 스타일을 적용하려면 외부 CSS 파일을 링크하거나,
        다른 적절한 방식으로 관리해야 합니다.
    --%>
</head>
<body>
<h1>할 일 수정</h1>

<%-- todoDTO 객체가 request scope에 저장되어 있으므로 EL로 바로 접근 가능 --%>
<%-- 예를 들어, http://localhost:8080/todo/update?tno=0 으로 접근하면 tno=0 인 데이터가 미리 채워짐 --%>
<form action="/todo/update" method="post"> <%-- 폼 제출 시 POST 요청으로 /todo/update를 호출 --%>
    <%-- tno는 사용자가 직접 수정할 수 없으므로 hidden 타입으로 숨겨서 전달 --%>
    <input type="hidden" name="tno" value="${todoDTO.tno}">

    <p>
        <label for="title">제목:</label>
        <%-- 기존 todoDTO의 title 값을 input 필드에 미리 채움 --%>
        <input type="text" id="title" name="title" value="${todoDTO.title}" required>
    </p>
    <p>
        <label for="dueDate">마감일:</label>
        <%-- 기존 todoDTO의 dueDate 값을 input 필드에 미리 채움 --%>
        <input type="date" id="dueDate" name="dueDate" value="${todoDTO.dueDate}" required>
    </p>
    <p>
        <label for="finished">완료 여부:</label>
        <%-- 체크박스: finished 값이 true이면 'checked' 속성을 추가 --%>
        <input type="checkbox" id="finished" name="finished" value="true" ${todoDTO.finished ? 'checked' : ''}>
        <%--
            체크박스는 체크되었을 때만 'name=value' 쌍으로 전송됨.
            만약 체크가 해제된 경우에도 false 값을 확실히 보내고 싶다면,
            숨겨진 input 태그를 추가하여 false 값을 먼저 보내고, 체크박스가 체크되면 true가 덮어쓰도록 하는 트릭을 사용하기도 함.
            <input type="hidden" name="finished" value="false">
        --%>
    </p>
    <p>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='/todo/list'">취소</button>
    </p>
</form>

<p><a href="/todo/list">목록으로 돌아가기</a></p>
</body>
</html>