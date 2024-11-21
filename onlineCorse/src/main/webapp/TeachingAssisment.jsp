<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="onlineCorse.sqlControl.SelectionConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    if (session != null) {
        String name = (String) session.getAttribute("name");
        String user = (String) session.getAttribute("user");

        if ("admin".equals(user)) {%>
        	<jsp:include page="Home.jsp" />
    	  <%}
        else if("user".equals(user)){%>
        	<jsp:include page="Header.jsp" />
		<%}
	else { response.sendRedirect("login.jsp");}}%>

<div class="container mt-5">
    <form action="log" method="post">
        <div class="mb-3">
            <label for="uploadDate" class="form-label">Upload Date:</label>
            <input type="date" id="uploadDate" name="uploadDate" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="course" class="form-label">Course:</label>
            <select id="course" name="course" class="form-select" required>
                <%
                    SelectionConnection s = new SelectionConnection();
                    ArrayList<ControlDemo> dep = s.fetchDataCourse();
                    if (dep.isEmpty()) {
                %>
                    <option value="">No courses available</option>
                <%
                    } else {
                %>
                    <option value="">Select a course</option>
                <%
                        for (ControlDemo course : dep) {
                            int id = course.getCid();
                            String names = course.getCname();
                %>
                    <option value="<%= id %>"><%= names %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="mb-3">
            <label for="faculty" class="form-label">Faculty:</label>
            <select id="faculty" name="faculty" class="form-select" required>
                <%
                    ArrayList<ControlDemo> facultyList = s.fetchDataStudent();
                    if (facultyList.isEmpty()) {
                %>
                    <option value="">No faculty available</option>
                <%
                    } else {
                %>
                    <option value="">Select a faculty</option>
                <%
                        for (ControlDemo fac : facultyList) {
                            int id = fac.getId();
                            String names = fac.getFname();
                %>
                    <option value="<%= id %>"><%= names %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
