<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/01/2023
  Time: 7:02 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa phòng trọ</title>
</head>
<body>
<c:import url="/header-footer/header.jsp"></c:import>
<div class="row">
    <c:import url="/header-footer/sidebar.jsp"></c:import>
    <div class="col-10">
        <h1 style="text-align: center">Chỉnh sửa phòng trọ</h1>
        <div class="col-12 container-fluid">
            <h2>
                <a href="/phongtro">
                    <button class="btn btn-primary">Quay về danh sách</button>
                </a>
            </h2>
            <p class="text-danger">${mess}</p><br>
            <form method="post" action="/phongtro">
                <table class="table table-light">
                    <tr>
                        <c:if test="${phongTro != null}">
                            <td><input type="hidden" name="id" value="<c:out value='${phongTro.id}'/>"/></td>
                        </c:if>
                    </tr>
                    <tr>
                        <td>Mã phòng trọ: </td>
                        <td>
                            <input name="maPhongTro" style="width: 40%" value="${phongTro.maPhongTro}">
                        </td>
                    </tr>
                    <tr>
                        <td>Tên người thuê: </td>
                        <td>
                            <input name="name" style="width: 40%" value="${phongTro.tenNguoiThueTro}">
                        </td>0
                    </tr>
                    <tr>
                        <td>Số điện thoại: </td>
                        <td><input name="phone" style="width: 40%" value="${phongTro.getSoDienThoai()}"></td>
                    </tr>
                    <tr>
                        <td>Ngày thuê: </td>
                        <td><input type="date" name="date" style="width: 40%" value="${phongTro.getNgayThue()}"></td>
                    </tr>
                    <tr>
                        <td>Hình thức thanh toán: </td>
                        <td><select name="hinhThucList">
                            <option value="${phongTro.getHinhThuc().getId()}">${phongTro.getHinhThuc().getName()}</option>
                            <c:forEach var="hinhThucList" items="${hinhThucList}">
                                <c:if test="${hinhThucList.getId() != phongTro.getHinhThuc().getId()}">
                                    <option value="${hinhThucList.getId()}">${hinhThucList.getName()}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Ghi chú: </td>
                        <td><input name="ghiChu" style="width: 40%" value="${phongTro.getGhiChu()}"></td>
                    </tr>
                </table>
                <input class="btn btn-primary" type="reset" value="Reset" style="margin-left: 40%"/>
                <button class="btn btn-primary" type="submit" >Lưu</button>
                <input type="hidden" name="action" value="edit">
            </form>
        </div>
    </div>
</div>
<c:import url="/header-footer/footer.jsp"></c:import>
</body>
</html>
