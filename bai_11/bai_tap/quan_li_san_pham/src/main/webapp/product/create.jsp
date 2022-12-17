<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 16/12/2022
  Time: 6:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<h1>Thêm sản phẩm</h1>
<p><a href="/products">Quay lại trang danh sách</a></p>
<p class="text-danger">${message}</p>
<form class="" action="/products" method="post">
    <table class="table table-light">
        <tr>
            <td>Id</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>Tên</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Giá</td>
            <td><input type="number" name="price"></td>
        </tr>
        <tr>
            <td>Mô tả</td>
            <td><input type="text" name="description"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" name="producer"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="reset" value="Reset"/>
                <input type="submit" value="Create"/>
            </td>
        </tr>
    </table>
    <input type="hidden" name="action" value="create">
</form>
</body>
</html>
