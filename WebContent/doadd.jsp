
<%@ page import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<!-- 处理操作的页面，并非用于显示数据,所以无需任何HTML代码 -->
<%
	request.setCharacterEncoding("UTF-8");
	String ISBN =request.getParameter("ISBN ");
	String Title=request.getParameter("Title");
	String AuthorID=request.getParameter("AuthorID");
	String Publisher=request.getParameter("Publisher");
	String PublishDate=request.getParameter("PublishDate");
	String Price=request.getParameter("Price");
	UserInfo obj=new UserInfo();
	obj.setISBN(ISBN);
	obj.setTitle(Title);
	obj.setAuthorID(AuthorID);
	obj.setPublisher(Publisher);
	obj.setPublishDate(PublishDate);
	obj.setPrice(Price);
	
	UserInfoDao dao=new UserInfoDao();
	dao.save(obj);

	response.sendRedirect("index.jsp");
%>