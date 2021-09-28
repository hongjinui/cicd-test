<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
    <body>
    <p>Hello World</p>
    <p>현재 시각 : ${time}</p>
    <p>호스트 이름 : ${hostName}</p>
    <p>호스트 어드레드 : ${hostAddress}</p>

    <c:forEach var="data" items="${dataList}">
        <p>이름 : ${data.name}, 나이 : ${data.age}</p>
    </c:forEach>

    </body>
</html>
