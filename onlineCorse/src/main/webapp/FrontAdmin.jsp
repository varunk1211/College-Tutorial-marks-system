<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
</head>
<body>
<%
    if (session != null) {
        String name = (String) session.getAttribute("name");
        String user = (String) session.getAttribute("user");

        if ("admin".equals(user)) {
            // Include another JSP page dynamically based on condition
            %><jsp:include page="Home.jsp" /><%
        }
        else{%>
        <jsp:include page="Header.jsp" />
<%
    }
        }
%>
</body>
</html>
