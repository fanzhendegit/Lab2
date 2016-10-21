<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#table-4 thead, #table-4 tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(211, 202, 221);
}
#table-4 {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(211, 202, 221);
}

/* Padding and font style */
#table-4 td, #table-4 th {
padding: 5px 10px;
font-size: 15px;
font-family: Verdana;
color: rgb(95, 74, 121);
}

/* Alternating background colors */
#table-4 tr:nth-child(even) {
background: rgb(223, 216, 232)
}
#table-4 tr:nth-child(odd) {
background: #FFF
}
</style>
</head>
<body>
<h1 style="text-align:center;color:rgb(95, 74, 121)">图书列表</h1>
<table align="center" id="table-4">
<thead>
<tr>
<th>Title</th>
</tr>
</thead>
 <c:forEach items="${bookList}" var="book">
    <tr>
        <td><a href="detail.jsp?ISBN=${book.getISBN()}">${book.getTitle()}</a></td>
    </tr>
 </c:forEach>
</table>
<a href="index.jsp">返回</a>
</body>
</html>