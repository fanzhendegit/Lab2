<pre name="code" class="javascript"><%@ page
		import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<html>
  <head>  
    <title></title>
  </head>
  <%
  	UserInfoDao dao=new UserInfoDao();
  	ArrayList<UserInfo> list=dao.findAll();
  %>
  
   <script type="text/javascript">  
    function myAction(pid){  
        document.forms[0].id.value=pid;  
        document.forms[0].submit();  
    }  
   </script>  
   
  <body>
	<h1 align="center"><br></h1><h1 align="center">    图书馆</h1>
	<form action="find.jsp" method="post" border="1">
		<!-- 用于存放选择的id，然后会随表单提交给服务器处理页面 -->
		<input type="hidden" name="id">
		<table align="center"  width="80%",cellspacing="0">
			<tr>
					<td><input name="AuthorID" placeholder="输入作者名字查询作品"></td>
	        		<td><input type="submit" value="查询" id="but"></td>
			</tr>
		</table>
	</form>>
	<form action="doRemove.jsp" method="post">
		<!-- 用于存放选择的id，然后会随表单提交给服务器处理页面 -->
		<input type="hidden" name="id">
		<table align="center" width="80%",cellspacing="0" border="1">
			<tr>
				<td colspan="8" align="right">
					<a href="add.jsp">添加新信息</a>				</td>
			</tr>
			<tr>
				<th>ID</th>
				<th>ISBN</th>
				<th>Title</th>
				<th>AuthorID</th>
				<th>Publisher</th>
				<th>PublishDate</th>
				<th> Price</th>
				<th>操作</th>
			</tr>
			<%for(int i=0;i<list.size();i++){
				UserInfo obj=(UserInfo)list.get(i);%>
				<!--Html代码-->
				<tr>
					<td><%=obj.getId()%></td>
					<td><%=obj.getISBN()%></td>
					<td><%=obj.getTitle()%></td>
					<td><%=obj.getAuthorID()%></td>
					<td><%=obj.getPublisher()%></td>
					<td><%=obj.getPublishDate()%></td>
					<td><%=obj.getPrice()%></td>
					<td>
	                       <a href="detail.jsp?ISBN=<%=obj.getISBN()%>">查看</a>   
	                       <input type="button" value="删除" onclick="myAction('<%=obj.getId()%>')"/>
					</td>
				</tr>
			<%}%>
		</table>
	</form>
  </body>
<html>