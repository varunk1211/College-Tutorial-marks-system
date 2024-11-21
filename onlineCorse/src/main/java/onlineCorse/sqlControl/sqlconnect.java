package onlineCorse.sqlControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class sqlconnect {
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
	
public boolean InsertStudent(String firstname ,String lastname,String dob,String gender,String email,String password,int departmentID ) {
		String insertQuarryStudent="insert into Students(FirstName,LastName,DateOfBirth,Gender,Email,PassWordHash,DepartmentID)"
				+ "values('"+firstname+"','"+lastname+"','"+dob+"','"+gender+"','"+email+"','"+password+"','"+departmentID+"');";
		try {
			ps=con.prepareStatement(insertQuarryStudent);
			int result=ps.executeUpdate();
			if(result>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				ps.close();
				
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

public boolean InsertFaculty(String firstname ,String lastname,String dob,String gender,String email,String password,int departmentID ) {
	String insertQuarryStudent="insert into Faculty(FirstName,LastName,DateOfBirth,Gender,Email,PassWordHash,DepartmentID)"
			+ "values('"+firstname+"','"+lastname+"','"+dob+"','"+gender+"','"+email+"','"+password+"','"+departmentID+"');";
	try {
		ps=con.prepareStatement(insertQuarryStudent);
		int result=ps.executeUpdate();
		if(result>0) {
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		try {
			ps.close();
			
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return false;
}

public boolean InsertVideo(int cid ,String vtitle,String vurl,String udate) {
	String insertQuarryVideo="insert into CourseVideos(CourseID,VideoTitle,VideoURL,UploadDate) values('"+cid+"','"+vtitle+"','"+vurl+"','"+udate+"'); ";
	try {
		ps=con.prepareStatement(insertQuarryVideo);
		int result=ps.executeUpdate();
		if(result>0) {
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		try {
			ps.close();
			
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return false;
}

public boolean InsertCourse(String cname,int credits,int did) {
	String insertQuarryVideo=" insert into courses (CourseName,Credits,DepartmentID) values('"+cname+"','"+credits+"','"+did+"')";
	try {
		ps=con.prepareStatement(insertQuarryVideo);
		int result=ps.executeUpdate();
		if(result>0) {
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		try {
			ps.close();
			
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return false;
}

	public static void main(String[] args) {
		
		sqlconnect c=new sqlconnect();
		System.out.println(c.InsertCourse("Data Structure", 4, 1));
	}
		
}
