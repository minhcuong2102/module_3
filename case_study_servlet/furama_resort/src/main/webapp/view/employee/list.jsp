<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 26/12/2022
  Time: 8:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lí nhân viên</title>
</head>
<body>
<c:import url="/view/header.jsp"></c:import>
<c:import url="/view/navbar.jsp"></c:import>
<div class="row">
    <c:import url="/view/sidebar.jsp"></c:import>

    <div class="col-10">
        <h1 class="text-center">Danh sách nhân viên</h1>
        <h2><a href="/employee?action=create">
            <button class="btn btn-primary">Thêm người dùng</button>
        </a></h2>
        <p class="text-danger">${mess}</p>

        <form action="/employee?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" hidden value="search" name="action">
            <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
            <button type="submit" class="btn btn-primary" hidden>Tìm kiếm</button>
        </form><br>

        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Id</th>
                <th>Tên nhân viên</th>
                <th>Ngày sinh</th>
                <th>Mã số</th>
                <th>Lương</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Vị trí</th>
                <th>Bằng cấp</th>
                <th>Bộ phận</th>
                <th>Username</th>
                <th>Sửa</th>
                <th>Xoá</th>
            </tr>
            <c:forEach var="employee" items="${employeeList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${employee.getId()}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<c:import url="/view/footer.jsp"></c:import>
</body>
</html>
