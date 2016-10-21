package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class BaseDao {
	public static Connection getConnection()throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_webproject2";
		String username="1o0nnmzn3n";
		String userPassword="kmzj0ji10mlzki24m0m5ilm41zyl32y53hx1mjh0";
		return DriverManager.getConnection(url,username,userPassword);
	}
	
	public static void close(ResultSet rs,Statement sta,Connection con)throws Exception{
		if(rs!=null){
               rs.close();
		}
		if(sta!=null){
               sta.close();
		}
		if(con!=null){
               con.close();
		}
	}
}
