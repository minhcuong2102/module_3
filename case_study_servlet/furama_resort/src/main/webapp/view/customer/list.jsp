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
    <title>Quản lý khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<c:import url="/view/header.jsp"></c:import>
<c:import url="/view/navbar.jsp"></c:import>
<div class="row">
    <c:import url="/view/sidebar.jsp"></c:import>

    <div class="col-10">
        <h1 class="text-center">Danh sách khách hàng</h1>
        <h2>
            <a href="/customer?action=create">
                <button class="btn btn-primary">Thêm khách hàng</button>
            </a>
        </h2>
        <p class="text-danger">${mess}</p>

        <form action="/customer?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" hidden value="search" name="action">
            <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
            <button type="submit" class="btn btn-primary" hidden>Tìm kiếm</button>
        </form>
        <br>

        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <%--                <th>Id</th>--%>
                <th>Loại khách</th>
                <th>Tên khách hàng</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Mã số</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Sửa</th>
                <th>Xoá</th>
            </tr>
            <c:forEach var="customer" items="${customerList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                        <%--                    <td>${customer.getId()}</td>--%>
                    <td>${customer.getCustomerType().getCustomerTypeName()}</td>
                    <td>${customer.name}</td>
                    <td>${customer.dateOfBirth}</td>
                    <c:if test="${customer.gender}">
                        <td><c:out value="Nam"/></td>
                    </c:if>
                    <c:if test="${!customer.gender}">
                        <td><c:out value="Nữ"/></td>
                    </c:if>
                    <td><c:out value="${customer.idCard}"/></td>
                    <td><c:out value="${customer.phoneNumber}"/></td>
                    <td><c:out value="${customer.email}"/></td>
                    <td><c:out value="${customer.address}"/></td>
                    <td>
                        <a href="/customer?action=edit&id=${customer.id}">
                            <button class="btn btn-primary">Sửa</button>
                        </a>
                    </td>
                    <td>
                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                                onclick="showDeleteForm(${customer.getId()}, '${customer.getName()}')">Xoá
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Xoá khách hàng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có muốn xoá khách hàng <span id="customerName"></span><span> không?</span>
                    </div>
                    <form action="/customer?action=delete" method="get">
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

    </div>
</div>
<c:import url="/view/footer.jsp"></c:import>
</body>
<script>
    function showDeleteForm(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("customerName").innerText = name;
    }
</script>
</html>
