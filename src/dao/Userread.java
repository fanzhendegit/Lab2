package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import entity.Author;
import entity.UserInfo;
@SuppressWarnings("serial")
public class Userread  extends ActionSupport{
	@SuppressWarnings("resource")
	public  String ListBookTitle() throws Exception{
		List<UserInfo> bookList=new ArrayList<UserInfo>();
		Author au = new Author();
		String name=ServletActionContext.getRequest().getParameter("AuthorID");
		String sql="select * from author where name="+"'"+name+"'";
		String Ai ="";
		HttpSession session = ServletActionContext.getRequest().getSession(); 
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        System.out.println("ok");
        try{
            con=BaseDao.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
            	System.out.println("ok1");
            	au.setAuthorID(rs.getString("AuthorID"));
            	au.setname(rs.getString("name"));
            	au.setage(rs.getString("age"));
            	au.setcountry(rs.getString("country"));
            	session.setAttribute("au", au);
            	Ai=rs.getString("AuthorID");
            }
            else{
            	return "notfound";
            }
            try{
            	ps=con.prepareStatement("select * from book where AuthorID="+"'"+Ai+"'");
	            rs=ps.executeQuery();
	            while(rs.next())
	            {
	            	System.out.println("ok2");
	            	UserInfo book=new UserInfo();
	            	book.setISBN(rs.getString("ISBN"));
	            	book.setTitle(rs.getString("Title"));
	            	book.setAuthorID(rs.getString("AuthorId"));
	            	book.setPublisher(rs.getString("Publisher"));
	            	book.setPublishDate(rs.getString("PublishDate"));
	            	book.setPrice(rs.getString("Price"));
	            	bookList.add(book);
	            }
	            
	            session.setAttribute("bookList", bookList); 
	            return "found";
            }catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        finally{
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(con!=null)con.close();
        }
        return "error";
	}
}
