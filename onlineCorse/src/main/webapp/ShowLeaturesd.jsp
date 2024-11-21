<%@page import="onlineCorse.DatabasConnect.ControlDemo"%>
<%@page import="onlineCorse.sqlControl.SelectionConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .video-card {
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .video-frame {
            width: 100%;
            height: 315px; /* Fixed height for the video */
            transition: opacity 0.3s;
        }
        .card-body {
            text-align: center;
        }
        .card {
            border: 1px solid #dee2e6;
            border-radius: 0.375rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .card:hover .video-frame {
            opacity: 0.85;
        }
        @media (max-width: 767px) {
            .video-frame {
                height: 200px; /* Adjust height for smaller screens */
            }
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
    <h2 class="mb-4">Video List</h2>
    <div class="row">
        <%
            ArrayList<ControlDemo> videos = (ArrayList<ControlDemo>) request.getAttribute("vidList");
            if (videos != null && !videos.isEmpty()) {
                for (ControlDemo video : videos) {
                    String title = video.getVtitle();
                    String url = video.getUrl();
                    String uploadDate = video.getUdate();
                    int courseName = video.getCid();
                    // Extract video ID from the URL if needed
                    String videoId = url.contains("v=") ? url.substring(url.indexOf("v=") + 2) : url;
        %>
        <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
            <div class="card video-card">
                <iframe class="card-img-top video-frame" src="https://www.youtube.com/embed/<%= videoId %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                <div class="card-body">
                    <h5 class="card-title"><%= title %> - <%= courseName %></h5>
                    <p class="card-text">Uploaded on: <%= uploadDate %></p>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No videos available.</p>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
