<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 19/12/2022
  Time: 7:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
<head>
    <title>Add new user</title>
</head>
<body>
<h1>Thêm sản phẩm</h1>
<p><a href="/users"><button class="btn btn-primary">Quay lại trang danh sách</button></a></p>
<p class="text-danger">${message}</p>
<form class="" action="/users" method="post">
    <table class="table">
<%--        <tr>--%>
<%--            <td>Id</td>--%>
<%--            <td><input type="text" name="id"></td>--%>
<%--        </tr>--%>
        <tr>
            <td>Tên</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Quốc gia</td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input class="btn btn-primary" type="reset" value="Reset"/>
                <input class="btn btn-primary" type="submit" value="Tạo người dùng"/>
            </td>
        </tr>
    </table>
    <input type="hidden" name="action" value="create">
</form>
</body>
</html>
