<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/12/2022
  Time: 7:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chỉnh sửa thông tin khách hàng</title>
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
        <div style="text-align: center">
            <h1>Chỉnh sửa thông tin khách hàng</h1>
        </div>
        <p class="text-danger">${mess}</p><br>
        <div class="col-12 container-fluid">
            <h2>
                <a href="/customer">
                    <button class="btn btn-primary">Quay về danh sách khách hàng</button>
                </a>
            </h2>
            <form method="post" action="/customer">
                <table class="table table-light">
                    <c:if test="${customer != null}">
                        <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
                    </c:if>
                    <tr>
                        <td>Tên: </td>
                        <td>
                            <input name="name" style="width: 40%" value="${customer.name}">
                        </td>
                    </tr>
                    <tr>
                        <td>Loại khách: </td>
                        <td>
                            <select name="customerType">
                                <option value="${customer.customerType.customerTypeId}">${customer.customerType.customerTypeName}</option>
                                <c:forEach var="customerType" items="${customerTypes}">
                                    <c:if test="${customerType.getCustomerTypeId() != customer.customerType.customerTypeId}">
                                        <option value="${customerType.customerTypeId}">${customerType.customerTypeName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày sinh: </td>
                        <td>
                            <input type="date" name="dayOfBirth" value="${customer.dateOfBirth}">
                        </td>
                    </tr>
                    <tr>
                        <td>Giới tính: </td>
                        <td>
                            <input type="radio" name="gender" value="true" checked = "checked"> Nam
                            <input type="radio" name="gender" value="false" ${checked}> Nữ
                        </td>
                    </tr>
                    <tr>
                        <td>Mã số: </td>
                        <td>
                            <input name="idCard" value="${customer.idCard}">
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại: </td>
                        <td>
                            <input name="phone" value="${customer.phoneNumber}">
                        </td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td>
                            <input name="email" value="${customer.email}">
                        </td>
                    </tr>
                    <tr>
                        <td>Địa chỉ: </td>
                        <td>
                            <input name="address" value="${customer.address}">
                        </td>
                    </tr>
                </table>
                <input class="btn btn-primary" type="reset" value="Reset" style="margin-left: 40%"/>
                <button class="btn btn-primary" type="submit" >Lưu</button>
                <input type="hidden" name="action" value="edit">
            </form>
        </div>
    </div>
</div>
<c:import url="/view/footer.jsp"></c:import>
</body>
</html>
