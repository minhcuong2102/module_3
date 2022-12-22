<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 19/12/2022
  Time: 7:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>User list</title>
</head>
<body>
<h1 class="text-center">User Management</h1>
<h2><a href="/users?action=create">
    <button class="btn btn-primary">Thêm người dùng</button>
</a></h2>
<p class="text-danger">${mess}</p>
<div class="col-6">
    <form action="/users?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
        <input type="search" hidden value="search" name="action">
        <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
        <button type="submit" class="btn btn-primary" hidden>Tìm kiếm</button>
    </form><br>
</div>
<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Quốc gia</th>
        <th>Sửa</th>
        <th>Xoá</th>
    </tr>
    <c:forEach var="user" items="${userList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <a href="/users?action=edit&id=${user.id}">
                    <button class="btn btn-primary">Sửa</button>
                </a></td>
            <td>
                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                        onclick="showDeleteForm(${user.getId()}, '${user.getName()}')">Xoá
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
                <h5 class="modal-title" id="staticBackdropLabel">Xoá người dùng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có muốn xoá người dùng <span id="nameProductDelete"></span><span> không?</span>
            </div>
            <form action="/users?action=delete" method="get">
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
