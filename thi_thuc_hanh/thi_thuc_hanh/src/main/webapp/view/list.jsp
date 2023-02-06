<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 09/01/2023
  Time: 6:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách phòng trọ</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css">
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="datatables/js/jquery.dataTables.min.js"></script>
    <script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</head>
<body>
<c:import url="/header-footer/header.jsp"></c:import>
<div class="row">
    <c:import url="/header-footer/sidebar.jsp"></c:import>
    <div class="col-10">
        <h1 style="text-align: center">Danh sách phòng trọ</h1>
        <h2>
            <a href="/phongtro?action=create">
                <button class="btn btn-primary">Thêm phòng trọ</button>
            </a>
        </h2>
        <p class="text-danger">${mess}</p>
        <form action="/phongtro?action=search" method="get" class="row d-flex">
            <input name="action" value="search" hidden>
            <div class="col-md-3">
                <input type="search" class="form-control" placeholder="Nhập mã phòng trọ" name="idSearch">
            </div>
            <div class="col-md-3">
                <input type="search" class="form-control" placeholder="Nhập tên người thuê" name="nameSearch">
            </div>
            <div class="col-md-3">
                <input type="search" class="form-control" placeholder="Nhập số điên thoại" name="phoneNumberSearch">
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary ">Tìm kiếm</button>
            </div>
        </form>

        <table id="table1" class="table table-striped table-bordered" style="width: 100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã phòng trọ</th>
                <th>Tên người thuê trọ</th>
                <th>Số điện thoại</th>
                <th>Ngày bắt đầu thuê</th>
                <th>Hình thức thanh toán</th>
                <th>Ghi chú</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="phongTro" items="${phongTroList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${phongTro.getMaPhongTro()}</td>
                    <td>${phongTro.getTenNguoiThueTro()}</td>
                    <td>${phongTro.getSoDienThoai()}</td>
                    <td>${phongTro.getNgayThue()}</td>
                    <td>${phongTro.getHinhThuc().getName()}</td>
                    <td>${phongTro.getGhiChu()}</td>
                    <td>
                        <a href="/phongtro?action=edit&id=${phongTro.getId()}">
                            <button class="btn btn-primary">Sửa</button>
                        </a>
                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                                onclick="showDeleteForm(${phongTro.getId()}, '${phongTro.getMaPhongTro()}')">Xoá
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-primary">Xoá</button>
    </div>
</div>
<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Xoá phòng trọ</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có muốn xoá phòng trọ <span id="tenPhongTro"></span><span> không?</span>
            </div>
            <form action="/phongtro?action=delete" method="get">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xoá</button>
                    <input hidden name="id" type="text" id="idDelete">
                    <input hidden name="action" value="delete" type="text" id="">
                </div>
            </form>
        </div>
    </div>
</div>
<c:import url="/header-footer/footer.jsp"></c:import>
</body>
<script>
    $(document).ready(function () {
        $('#table1').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script>
    function showDeleteForm(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("tenPhongTro").innerText = name;
    }
</script>
</html>
