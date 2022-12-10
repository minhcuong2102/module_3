<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/12/2022
  Time: 8:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/display-discount" method="post">
    <label>Product Description<input name="product_description" type="text"></label>
    <label>List Price<input name="price" type="number"></label>
    <label>Discount Percent<input name="discount" type="number"></label>
    <button type="submit">Calculate Discount</button>
  </form>
  </body>
</html>
