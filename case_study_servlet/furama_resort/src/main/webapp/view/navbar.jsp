<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 26/12/2022
  Time: 9:06 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>
