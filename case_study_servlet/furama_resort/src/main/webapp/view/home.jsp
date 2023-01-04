<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 26/12/2022
  Time: 5:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<header class="row navbar navbar-expand-lg">
    <div class="container-fluid">
        <img src="" alt="Logo">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <h4 style="font-family: 'Arial Black',fantasy"><a class="navbar-brand text-danger" href="/view/home.jsp">FURAMA RESORT</a></h4>
                </li>
            </ul>
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <h5 style="margin-right: 20px">Huỳnh Minh Cường</h5>
                </li>
            </ul>
        </div>
    </div>
</header>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 7%">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto col-10">
            <li class="nav-item active">
                <a class="nav-link" href="/view/home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/employee">Employee</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/customer">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/service">Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contract">Contract</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0 col-2">
            <input class="form-control mr-sm-2 ct-search-textbox" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" hidden>Search</button>
        </form>
    </div>
</nav>
<div class="row">
    <div class="col-2">
        <ul class="list-group vh-79 left-nav-scroll" style="height: 81%">
            <li class="list-group-item">Item 1</li>
            <li class="list-group-item">Item 2</li>
            <li class="list-group-item">Item 3</li>
            <li class="list-group-item">Item 4</li>
            <li class="list-group-item">Item 5</li>
            <li class="list-group-item">Item 6</li>
            <li class="list-group-item">Item 7</li>
            <li class="list-group-item">Item 8</li>
            <li class="list-group-item">Item 9</li>
            <li class="list-group-item">Item 10</li>
            <li class="list-group-item">Item 11</li>
            <li class="list-group-item">Item 12</li>
            <li class="list-group-item">Item 13</li>
            <li class="list-group-item">Item 14</li>
            <li class="list-group-item">Item 15</li>
        </ul>
    </div>

    <div class="col-10">
        <p>Phần thân của trang web</p>
    </div>
</div>
<footer class="col-12 bg-light text-center">
    <p>Footer</p>
</footer>
</body>
</html>
