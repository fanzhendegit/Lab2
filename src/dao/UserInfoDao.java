package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entity.UserInfo;

@SuppressWarnings("serial")
public class UserInfoDao extends ActionSupport
{
	//查询所有（查）
	public ArrayList<UserInfo> findAll(){
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		ArrayList<UserInfo> list=new ArrayList<UserInfo>();
		String sql="select * from book";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			rs=psta.executeQuery();
			while(rs.next()){
				UserInfo obj=new UserInfo();
				obj.setId(rs.getInt(1));
				obj.setISBN(rs.getString(2));
				obj.setTitle(rs.getString(3));
				obj.setAuthorID(rs.getString(4));
				obj.setPublisher(rs.getString(5));
				obj.setPublishDate(rs.getString(6));
				obj.setPrice(rs.getString(7));
				list.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;

	}
	
	
	//add方法
	public boolean save(UserInfo obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="insert into book values(?,?,?,?,?,?)";
		boolean flag=false;
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getISBN());
			psta.setString(2, obj.getTitle());
			psta.setString(3, obj.getAuthorID());
			psta.setString(4, obj.getPublisher());
			psta.setString(5, obj.getPublishDate());
			psta.setString(6, obj.getPrice());
			flag=psta.executeUpdate()>0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				BaseDao.close(null, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return flag;
		}
	}
	
	//删除方法（删）
	public boolean remove(int id){
		Connection con=null;
		PreparedStatement psta=null;
		boolean flag=false;
		String sql="delete from book where id=?";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setInt(1, id);
			flag=psta.executeUpdate()>0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				BaseDao.close(null, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return flag;
		}
	}
	
	
}
