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
    <title>Chỉnh sửa sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<h1>Chỉnh sửa sản phẩm</h1>
<p><a href="/products">Quay lại trang danh sách</a></p>
<form action="/products?action=edit&&id=${product.id}" method="post">
    <table class="table table-striped">
        <tr>
            <td>Id</td>
            <td>${product.id}"</td>
        </tr>
        <tr>
            <td>Tên</td>
            <td><input type="text" name="name" value="${product.name}"></td>
        </tr>
        <tr>
            <td>Giá</td>
            <td><input type="number" name="price" value="${product.price}"></td>
        </tr>
        <tr>
            <td>Mô tả</td>
            <td><input type="text" name="description" value="${product.description}"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" name="producer" value="${product.producer}"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="reset" value="Reset"/>
                <input type="submit" value="Update"/>
            </td>
        </tr>
    </table>
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${product.id}">
</form>
</body>
</html>
