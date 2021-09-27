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

        <span><c:out value="${data.name}" /><c:out value="${data.age}" /> </span>
        <br>
    </c:forEach>

    </body>
</html>
