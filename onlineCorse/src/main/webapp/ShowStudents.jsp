<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<%@page import="onlineCorse.sqlControl.SelectionConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> students Details</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
<div class="container">
    <h2 class="my-4">students Details</h2>

    <%
        SelectionConnection s = new SelectionConnection();
        ArrayList<ControlDemo> facultyList =s.fetchDataStudent();
    %>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Department</th>
            </tr>
        </thead>
        <tbody>
           <%  for(ControlDemo faculty : facultyList){
        	   int id=faculty.getId();
              String fname=faculty.getFname();
              String date=faculty.getDob();
          	  String gender=faculty.getGender();
              String email= faculty.getEmail();
              String dname= faculty.getdname();
           %>
                <tr>
                    <td><%=id %></td>
                    <td><%=fname %></td>
                    <td><%=date %></td>
                    <td><%=gender %></td>
                    <td><%=email %></td>
                    <td><%=dname %></td>
                </tr>
           <%} %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
