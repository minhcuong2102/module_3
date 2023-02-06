<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 04/01/2023
  Time: 8:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm dịch vụ</title>
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
        <h1 style="text-align: center">Thêm dịch vụ</h1>
        <a href="/facility">
            <button type="button" class="btn btn-primary" style="margin: 10px">Quay lại danh sách dịch vụ</button>
        </a>
        <p class="text-danger">${mess}</p>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="pills-villa-tab" data-bs-toggle="pill" data-bs-target="#pills-villa"
                        type="button" role="tab" aria-controls="pills-villa" aria-selected="true">Villa
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-house-tab" data-bs-toggle="pill" data-bs-target="#pills-house"
                        type="button" role="tab" aria-controls="pills-house" aria-selected="false">House
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-room-tab" data-bs-toggle="pill" data-bs-target="#pills-room"
                        type="button" role="tab" aria-controls="pills-room" aria-selected="false">Room
                </button>
            </li>
        </ul>

        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-villa" role="tabpanel" aria-labelledby="pills-villa-tab">
                <form class="container-fluid" action="/facility?action=create" method="post">
                    <table class="table table-light">
                        <tr>
                            <td>Tên dịch vụ</td>
                            <td>
                                <input type="text" class="form-control" name="name">
                            </td>
                        </tr>
                        <tr>
                            <td>Diện tích</td>
                            <td>
                                <input type="text" class="form-control" name="area">
                            </td>
                        </tr>
                        <tr>
                            <td>Giá thuê</td>
                            <td>
                                <input type="text" class="form-control" name="cost">
                            </td>
                        </tr>
                        <tr>
                            <td>Số người tối đa</td>
                            <td>
                                <input type="text" class="form-control" name="maxPeople">
                            </td>
                        </tr>
                        <tr>
                            <td>Kiểu thuê</td>
                            <td>
                                <select  class="form-select" name="rentalTypeId">
                                    <option value="0">Chọn kiểu thuê</option>
                                    <c:forEach var="rentType" items="${rentTypeList}">
                                        <option value="${rentType.getId()}">${rentType.getName()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Tiêu chuẩn phòng</td>
                            <td>
                                <input type="text" class="form-control" name="standardRoom">
                            </td>
                        </tr>
                        <tr>
                            <td>Tiêu chuẩn phòng</td>
                            <td>
                                <input type="text" class="form-control" name="standardRoom">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>


            <div class="tab-pane fade show active" id="pills-house" role="tabpanel" aria-labelledby="pills-house-tab">
                <form class="g-3" action="/facility?action=create" method="post">

                </form>
            </div>

            <div class="tab-pane fade show active" id="pills-room" role="tabpanel" aria-labelledby="pills-room-tab">
                <form class="g-3" action="/facility?action=create" method="post">

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
