package onlineCorse.DatabasConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connectivity {
	
	static Connection con;
	static ResultSet rs;
	static Statement st;
	static PreparedStatement ps;
	static{
			try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
			 st=con.createStatement();
			} 
		catch (ClassNotFoundException se) {
			se.printStackTrace();
		} 
		catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		}
	}
	
	
	public String user( String email, String password) 
	{
			String ShowQuarry="select * from Students where email='"+email+"' and  passwordHash='"+password+"';";
			 try {
				rs=st.executeQuery(ShowQuarry);
				if(rs.next()) {
					  return rs.getString(2);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return null;
	}
	
	
public  String admine( String email, String password)  {
		 String AdmineQuarry="select concat(FirstName,' ',LastName )from faculty where email='"+email+"' and  passwordHash='"+password+"';" ;
		 try {
			rs=st.executeQuery(AdmineQuarry);
			if(rs.next()) {
				
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  null;
	}

public static void main(String[] args) {
	Connectivity c=new Connectivity();
//	System.out.print(c.user("varun@gmail.com","varun123"));
	System.out.print(c.admine("varun@gmail.com","varun123"));
}
}
