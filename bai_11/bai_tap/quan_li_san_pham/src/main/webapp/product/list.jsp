<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 14/12/2022
  Time: 8:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Product list</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Product list</h1>
<form action="">
    <label>Tìm kiếm theo tên:</label>
    <input type="text" name="searchByName">
    <input type="submit" value="Search">
    <input type="hidden" name="action" value="findByName">
</form>
<a href="/products?action=create">
    <button class="btn btn-primary">Thêm sản phẩm mới</button>
</a><br>
<table class="table table-striped" style="text-align: center">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Chi tiết</th>
        <th>Sửa</th>
        <th>Xoá</th>
    </tr>
    <c:forEach items="${productList}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=detail&&id=${product.getId() - 1}">
                <button class="btn btn-primary">Chi tiết</button>
            </a></td>
            <td><a href="/products?action=edit&&id=${product.getId() - 1}">
                <button class="btn btn-primary">Sửa</button>
            </a></td>
            <td>
                <button class="btn btn-primary" data-toggle="modal" data-target="#deleteModal"
                        onclick="showDeleteForm(${product.getId()}, '${product.getName()}')">Xoá
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Xoá sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close">x</button>
            </div>
            <div class="modal-body">
                Bạn có muốn xoá sản phẩm <span id="nameProductDelete"></span> ?
            </div>
            <form action="/products?action=delete" method="get">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                    </button>
                    <button type="submit" class="btn btn-primary">Xoá</button>
                    <input hidden name="id" type="text" id="idDelete">
                    <input hidden name="action" value="delete" type="text" id="">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function showDeleteForm(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameProductDelete").innerText = name;
    }
</script>
</html>
