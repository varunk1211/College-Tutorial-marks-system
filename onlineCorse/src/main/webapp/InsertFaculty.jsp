<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="onlineCorse.sqlControl.SelectionConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Faculty Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            opacity: 0; /* Hidden initially */
            transform: translateY(20px); /* Start from below */
            transition: opacity 1s ease-out, transform 1s ease-out;
        }
        .form-container.visible {
            opacity: 1; /* Visible when class is added */
            transform: translateY(0); /* Move to original position */
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
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
		

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="col-md-6 form-container" id="form-container">
        <h2 class="form-title">Add Faculty Details</h2>
        <form action="fac" method="post">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <select class="form-control" id="department" name="department" required>
                    <%
                    SelectionConnection s = new SelectionConnection();
                    ArrayList<ControlDemo> dep = s.fetchDataDepartment();
                    if(dep.isEmpty()) {
                    %>
                        <option disabled>No departments available</option>
                    <%
                    } else {
                        for(ControlDemo deps: dep) {
                            int id = deps.getDepartmentid();
                            String name = deps.getdname();
                    %>
                            <option value="<%=id%>"><%=name %></option>
                    <%
                        }
                    }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Faculty</button>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const formContainer = document.getElementById('form-container');
        setTimeout(() => {
            formContainer.classList.add('visible');
        }, 100); // Delay to ensure the initial state is hidden
    });
</script>
</body>
</html>
