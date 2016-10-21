<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* Border styles */
.table-4 thead,.table-4 tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(211, 202, 221);
}
.table-4 {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(211, 202, 221);
}

/* Padding and font style */
.table-4 td, .table-4 th {
padding: 5px 10px;
font-size: 15px;
font-family: Verdana;
color: rgb(95, 74, 121);
}

/* Alternating background colors */
.table-4 tr:nth-child(even) {
background: rgb(223, 216, 232)
}
.table-4 tr:nth-child(odd) {
background: #FFF
}
</style>
</head>
<body>
	<table align="center"  class="table-4">
      <thead>
      <tr>
      	<th>ID</th>
        <th>ISBN</th>
        <th>Title</th>
        <th>AuthorID</th>
        <th>Publisher</th>
        <th>PublishDate</th>
        <th>Price</th>
    	</tr>
    <thead>
      <c:forEach items="${bookList}" var="book">
      <c:choose>
	  <c:when test="${book.getISBN()==param.ISBN}">
      <tr>
      	<td>${book.getId()}</td>
        <td>${book.getISBN()}</td>
        <td>${book.getTitle()}</td>
        <td>${book.getAuthorID()}</td>
        <td>${book.getPublisher()}</td>
        <td>${book.getPublishDate()}</td>
        <td>${book.getPrice()}</td>
      </tr>
      </c:when>
      </c:choose>
      </c:forEach>
  	</table>
  	<table align="center" class="table-4">
  		<tr>
  			<th>AuthorID</th>
  			<th>name</th>
  			<th>age</th>
  			<th>country</th>
  		</tr>
  		<tr>
  			<td>${au.getAuthorID()}</td>
  			<td>${au.getname()}</td>
  			<td>${au.getage()}</td>
  			<td>${au.getcountry()}</td>
  		</tr>
  	</table>
  	<a href="find.jsp">返回</a>
</body>
</html>