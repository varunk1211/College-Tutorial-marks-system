<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carousel Example</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" integrity="sha512-MkN1nC5aRgCZr4ozTp69BI4HdtJj8S5oE/Lb5Z0TBnElcAvlHBsxt6dIbwNUSk4RFvDmfOgg5ZfM2EoFPX/xjw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    .carousel-item img {
        height: 700px; /* Adjusted height */
        object-fit: cover;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <%
    if (session == null) {
        response.sendRedirect("login.jsp");
        
    } else {
        String name = (String) session.getAttribute("name");
        String user = (String) session.getAttribute("user");
        if ("admin".equals(user)) {
%>			
            <jsp:include page="Home.jsp" />
<%
        } else if ("user".equals(user)) {
%>
            <jsp:include page="Header.jsp" />
<%
        } else {
            response.sendRedirect("login.jsp");
        }
    }
%>
	
<div id="carouselExampleCaptions" class="carousel slide animate__animated animate__fadeIn" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ8F-fTntSYK0cqOAzJNkcc-QNjO6SwySLaQ&s" class="d-block w-100" alt="First Slide">
      <div class="carousel-caption d-none d-md-block">
        <h5>First Slide Label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://via.placeholder.com/800x400.png?text=Second+Slide" class="d-block w-100" alt="Second Slide">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second Slide Label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://www.comedk.org/uploads/mys_1.png" class="d-block w-100" alt="Third Slide">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third Slide Label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
