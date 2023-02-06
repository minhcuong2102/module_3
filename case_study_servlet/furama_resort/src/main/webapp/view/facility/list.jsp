<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 04/01/2023
  Time: 7:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách dịch vụ</title>
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
        <h1 class="text-center">Danh sách dịch vụ</h1>
        <h2>
            <a href="/facility?action=create">
                <button class="btn btn-primary">Thêm dịch vụ</button>
            </a>
        </h2>
        <p class="text-danger">${mess}</p>

        <form action="/facility?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" hidden value="search" name="action">
            <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
            <button type="submit" class="btn btn-light " hidden>Tìm kiếm</button>
        </form>

        <h2>Danh sách Villa</h2>
        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Diện tích</th>
                <th>Chi phí</th>
                <th>Số người tối đa</th>
                <th>Kiểu thuê</th>
                <th>Tiêu chuẩn phòng</th>
                <th>Mô tả tiện nghi khác</th>
                <th>Diện tích hồ bơi</th>
                <th>Số tầng</th>
                <th colspan="2" style="text-align: center">Thao tác</th>
            </tr>

            <c:forEach var="villa" items="${villaList}" varStatus="status">
                <tr>
                    <th>${status.count}</th>
                    <td>${villa.getName()}</td>
                    <td>${villa.getArea()}</td>
                    <td>${villa.getCost()}</td>
                    <td>${villa.getMaxPeople()}</td>
                    <td>${villa.getRentType().getName()}</td>
                    <td>${villa.getStandardRoom()}</td>
                    <td>${villa.getDescriptionOtherConvenience()}</td>
                    <td>${villa.getPoolArea()}</td>
                    <td>${villa.getNumberOfFloors()}</td>
                    <td>
                        <a href="/facility?action=edit&facilityType=villa&&id=${villa.getId()}">
                            <button type="button" class="btn btn-primary">Sửa</button>
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#deleteModal"
                                onclick="deleteFacility(${villa.getId()},'${villa.getName()}')">Xoá
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <h2>Danh sách House</h2>
        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Diện tích</th>
                <th>Chi phí</th>
                <th>Số người tối đa</th>
                <th>Kiểu thuê</th>
                <th>Tiêu chuẩn phòng</th>
                <th>Mô tả tiện nghi khác</th>
                <th>Số tầng</th>
                <th colspan="2" style="text-align: center">Thao tác</th>
            </tr>

            <c:forEach var="house" items="${houseList}" varStatus="status">
                <tr>
                    <th>${status.count}</th>
                    <td>${house.getName()}</td>
                    <td>${house.getArea()}</td>
                    <td>${house.getCost()}</td>
                    <td>${house.getMaxPeople()}</td>
                    <td>${house.getRentType().getName()}</td>
                    <td>${house.getStandardRoom()}</td>
                    <td>${house.getDescriptionOtherConvenience()}</td>
                    <td>${house.getNumberOfFloors()}</td>

                    <td>
                        <a href="/facility?action=edit&facilityType=house&&id=${house.getId()}">
                            <button type="button" class="btn btn-primary">Sửa</button>
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                                onclick="deleteFacility(${house.getId()},'${house.getName()}')">Xoá
                        </button>

                    </td>
                </tr>
            </c:forEach>
        </table>

        <h2>Danh sách Room</h2>
        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Diện tích</th>
                <th>Chi phí</th>
                <th>Số người tối đa</th>
                <th>Kiểu thuê</th>
                <th>Dịch vụ miễn phí đi kèm</th>
                <th colspan="2" style="text-align: center">Thao tác</th>
            </tr>

            <c:forEach var="room" items="${roomList}" varStatus="status">
                <tr>
                    <th>${status.count}</th>
                    <td>${room.getName()}</td>
                    <td>${room.getArea()}</td>
                    <td>${room.getCost()}</td>
                    <td>${room.getMaxPeople()}</td>
                    <td>${room.getRentType().getName()}</td>
                    <td>${room.getFacilityFree()}</td>

                    <td>
                        <a href="/facility?action=edit&facilityType=room&&id=${room.getId()}">
                            <button type="button" class="btn btn-primary">Sửa</button>
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                                onclick="deleteFacility(${room.getId()},'${room.getName()}')">Xoá
                        </button>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<c:import url="/view/footer.jsp"></c:import>

<!-- Modal -->
<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Xoá dịch vụ</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có muốn xoá khách hàng <span id="facilityName"></span><span> không?</span>
            </div>
            <form action="/facility?action=delete" method="get">
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
</body>
<script>
    function deleteFacility(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("facilityName").innerText = name;
    }
</script>
</html>
