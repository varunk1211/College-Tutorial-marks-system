<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    a {
        color: white;
    }
    .bg-video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: -1;
    }
    .navbar {
        background-color: #007bff;
        padding: 10px 20px;
        border-radius: 5px;
    }
    .navbar-brand, .nav-link, .navbar-toggler-icon {
        color: #fff !important;
    }
    .nav-link {
        margin: 0 10px;
    }
    .nav-link:hover {
        color: #ffcc00 !important;
    }
    .dropdown-menu {
        background-color: #007bff;
        border: none;
    }
    .dropdown-item {
        color: #fff !important;
    }
    .dropdown-item:hover {
        background-color: #0056b3;
    }
    .dark-mode {
        background-color: #121212;
        color: #e0e0e0;
    }
    .dark-mode .navbar {
        background-color: #333 !important;
    }
    .dark-mode .navbar-brand, .dark-mode .nav-link, .dark-mode .navbar-toggler-icon {
        color: #e0e0e0 !important;
    }
    .dark-mode .nav-link:hover {
        color: #ffcc00 !important;
    }
    .dark-mode .dropdown-menu {
        background-color: #333 !important;
    }
    .dark-mode .dropdown-item {
        color: #e0e0e0 !important;
    }
    .dark-mode .dropdown-item:hover {
        background-color: #444 !important;
    }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="AdminLogin.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="showdep">Insert Students</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="InsertFaculty.jsp">Insert Faculty</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="InsertCourses.jsp">Insert Course</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="showallvideo">Show Video</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="VideoInsert.jsp">Video Insert</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown link
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="showFacultyAssigned.jsp">Show Faculty Assigned Date</a></li>
            <li><a class="dropdown-item" href="asdf">Show Faculty</a></li>
            <li><a class="dropdown-item" href="ShowStudents.jsp">Show Students</a></li>
          </ul>
        </li>
        
      </ul>
      <button id="toggleMode" class="btn btn-outline-light">Switch to Dark Mode</button>
      <li class="nav-item">
          <a class="nav-link" href="LogoutServlet">log out</a>
        </li>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    document.getElementById('toggleMode').addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
        var button = document.getElementById('toggleMode');
        if (document.body.classList.contains('dark-mode')) {
            button.textContent = 'Switch to Light Mode';
        } else {
            button.textContent = 'Switch to Dark Mode';
        }
    });
</script>
</body>
</html>
