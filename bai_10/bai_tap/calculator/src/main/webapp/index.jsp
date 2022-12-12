<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 12/12/2022
  Time: 8:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form action="/calculator" method="get">
    <p>Calculator</p><br>
    <label>First operand: </label>
    <input type="text" name="first" value="${first}"><br>
    <label>Operator: </label>
    <select name="operator">
      <option value="+" >Addition</option>
      <option value="-">Subtraction</option >
      <option value="*">Multiplication</option>
      <option value="/">Division</option>
    </select><br>
    <label>Second operand: </label>
    <input type="text" name="second" value="${second}"><br>
    <input type="submit" value="Calculate">
  </form>
  </body>
</html>
