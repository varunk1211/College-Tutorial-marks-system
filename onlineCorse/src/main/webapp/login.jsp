<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body, html {
        height: 100%;
        margin: 0;
        overflow: hidden;
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
    .center-form {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
</style>
</head>

<body>

<video autoplay muted loop class="bg-video">
    <source src="image/img.mp4" type="video/mp4">
</video>

<div class="center-form">
    <form action="log" method="post">
        <div class="mb-3 text-center">
            <h2>Login</h2>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" required id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" required id="exampleInputPassword1">
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="radio" value="admin" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">Admin</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="radio" value="user" checked id="flexRadioDefault2">
            <label class="form-check-label" for="flexRadioDefault2">User</label>
        </div>
        <div class="mt-3 text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
