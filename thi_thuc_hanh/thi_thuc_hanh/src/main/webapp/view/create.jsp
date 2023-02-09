<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 09/01/2023
  Time: 7:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Thêm phòng trọ</title>
</head>
<body>
<c:import url="/header-footer/header.jsp"></c:import>
<div class="row">
    <c:import url="/header-footer/sidebar.jsp"></c:import>
    <div class="col-10">
        <h1 style="text-align: center">Thêm phòng trọ</h1>
        <h2>
            <a href="/phongtro">
                <button class="btn btn-primary">Quay về danh sách</button>
            </a>
        </h2>
        <p class="text-danger">${mess}</p><br>
        <form method="post" action="/phongtro">
            <table class="table table-light" style="width: 100%">
                <tr>
                    <td>Mã phòng trọ:</td>
                    <td><input name="maPhongTro" placeholder="Nhập mã" style="width: 40%"></td>
                </tr>
                <tr>
                    <td>Tên:</td>
                    <td><input name="name" placeholder="Nhập tên" style="width: 40%"></td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td><input name="phone" placeholder="Nhập số" style="width: 40%"></td>
                </tr>
                <tr>
                    <td>Ngày thuê:</td>
                    <td><input type="date" name="date" style="width: 40%"></td>
                </tr>
                <tr>
                    <td>Hình thức thanh toán:</td>
                    <td><select name="hinhThucList">
                        <option value="">--- Chọn loại khách ---</option>
                        <c:forEach var="hinhThucList" items="${hinhThucList}">
                            <option value="${hinhThucList.getId()}">${hinhThucList.getName()}</option>
                        </c:forEach>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Ghi chú:</td>
                    <td><input name="ghiChu" placeholder="Nhập ghi chú" style="width: 40%"></td>
                </tr>
            </table>
            <input class="btn btn-primary" type="reset" value="Reset" style="margin-left: 40%"/>
            <button class="btn btn-primary" type="submit">Thêm phòng trọ</button>
            <input type="hidden" name="action" value="create">
        </form>
    </div>
</div>
<c:import url="/header-footer/footer.jsp"></c:import>
</body>
</html>
