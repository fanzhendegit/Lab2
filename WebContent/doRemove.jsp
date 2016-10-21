
<%@ page import="java.util.*,dao.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	UserInfoDao dao=new UserInfoDao();
	int id=Integer.parseInt(request.getParameter("id"));
	String msg="操作出问题了,请稍后重试,或联系管理员";
	if(dao.remove(id)){
		msg="恭喜你,操作成功,成功删除id为"+id+"的数据";
	}
 %>
<%--
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="index.jsp";
</script>
 --%>
<%//response.sendRedirect("index.jsp"); %>
<!-- 2.显示信息,在一段时间后自动前往下一个页面 -->
<%-- 
<html>
	<head>
		<meta http-equiv="refresh" content="5;index.jsp">
	</head>
</html>
<h1><%=msg%>,5秒后返回首页,如浏览器无反应,<a href="index.jsp">请点击</a></h1>
--%>
<div id="msg">
	<h1><%=msg%>,5秒后返回首页,如浏览器无反应,<a href="index.jsp">请点击</a>
	</h1>
</div>
<script type="text/javascript">
	var count=4;
	window.setInterval(function(){
		if(count==0){
			location.href="index.jsp";
		}
		var div_msg=document.getElementById("msg");
		div_msg.innerHTML="<h1><%=msg%>,"+count+"秒后返回首页,如浏览器无反应,<a href='index.jsp'>请点击</a></h1>"
		count--;
	}, 1000);
</script>



