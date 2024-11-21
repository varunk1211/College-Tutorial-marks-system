<%@page import="onlineCorse.sqlControl.SelectionConnection"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Course</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            animation: fadeIn 2s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .btn-primary {
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
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
    <div class="container"> 
        <div class="form-container">
            <h2 class="text-center">Insert New Course</h2>
            <form action="Inse" method="post">
                <div class="form-group">
                    <label for="cname">Course Name:</label>
                    <input type="text" class="form-control" id="cname" name="cname" required>
                </div>
                <div class="form-group">
                    <label for="credits">Credits:</label>
                    <input type="number" class="form-control" id="credits" name="credits" required min="1">
                </div>
                <div class="form-group">
                    <label for="course">Branch:</label>
                    <select id="course" name="did" class="form-control" required>
                        <%
                            SelectionConnection s = new SelectionConnection();
                            ArrayList<ControlDemo> dep = s.fetchDataDepartment();
                            if (dep != null && !dep.isEmpty()) {
                                for (ControlDemo course : dep) {
                                    int id = course.getDepartmentid();
                                    String name = course.getdname();
                        %>
                            <option value="<%= id %>"><%= name %></option>
                        <%
                                }
                            } else {
                        %>
                            <option value="">No courses available</option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Submit</button>
            </form>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
