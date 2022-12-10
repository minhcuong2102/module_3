<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/12/2022
  Time: 8:13 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Product Description: ${product_description}</p>
<p>List Price: ${price}</p>
<p>Discount Percent: ${discount}</p>
<p>Discount amount = ${price * discount * 0.01}</p>
<p>Discount price = ${price - price * discount * 0.01}</p>
</body>
</html>
