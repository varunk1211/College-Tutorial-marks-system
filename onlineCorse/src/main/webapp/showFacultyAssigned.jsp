<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="onlineCorse.sqlControl.SelectionConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Display</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }
    .card {
        margin: 15px;
        width: 300px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s;
    }
    .card:hover {
        transform: scale(1.05);
    }
    .card-title, .card-subtitle {
        text-align: center;
    }
    .card-text {
        text-align: center;
        color: #555;
    }
    .card-footer {
        background-color: #f8f9fa;
        border-top: 1px solid rgba(0,0,0,.125);
    }
    .container {
        padding: 20px;
    }
</style>
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
    <%
    SelectionConnection s = new SelectionConnection();
    ArrayList<ControlDemo> d = s.fetchDataFacultyAssigned();
    if (d == null || d.isEmpty()) {
        %>
        <div class="alert alert-warning" role="alert">
            There is no data.
        </div>
        <%
    } else {
        %>
        <div class="card-container">
            <%
            for (ControlDemo c : d) {
                int id = c.getId();
                String cname = c.getCname();
                String fname = c.getFname();
                String date = c.getDate();
                %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= cname %></h5>
                        <h6 class="card-subtitle mb-2 text-muted"><%= fname %></h6>
                        <p class="card-text">Date: <%= date %></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">ID: <%= id %></small>
                    </div>
                </div>
                <%
            }
            %>
        </div>
        <%
    }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-csA1DcNgUvvdUq8GWsSglFFjvgAxTsHg6J0Czsyjz5vFWQUUHG9E7H5Hn9eJ57y" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
