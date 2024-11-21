<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="onlineCorse.sqlControl.SelectionConnection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Video Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" integrity="sha512-MkN1nC5aRgCZr4ozTp69BI4HdtJj8S5oE/Lb5Z0TBnElcAvlHBsxt6dIbwNUSk4RFvDmfOgg5ZfM2EoFPX/xjw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            animation: fadeIn 1s; /* Apply animation */
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6 form-container animate__animated animate__fadeIn">
            <h2 class="mt-4 text-center">Add Video Details</h2>
            <form action="goto" method="post">
                <div class="form-group">
                    <label for="title">Video Title:</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>

                <div class="form-group">
                    <label for="url">Video URL:</label>
                    <input type="url" class="form-control" id="url" name="url" required>
                </div>

                <div class="form-group">
                    <label for="uploadDate">Upload Date:</label>
                    <input type="date" class="form-control" id="uploadDate" name="uploadDate" required>
                </div>

                <div class="form-group">
                    <label for="course">Course:</label>
                    <select id="course" name="course" class="form-control" required>
                        <%
                            SelectionConnection s = new SelectionConnection();
                            ArrayList<ControlDemo> dep = s.fetchDataCourse();
                            if (dep != null && !dep.isEmpty()) {
                                for (ControlDemo course : dep) {
                                    int id = course.getCid();
                                    String name = course.getCname();
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

                <button type="submit" class="btn btn-primary btn-block">Add Video</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
