package onlineCorse.sqlControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import onlineCorse.DatabasConnect.ControlDemo;

public class SelectionConnection {
	
	
	static Connection con;
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
	
	public ArrayList<ControlDemo> fetchDataDepartment() {
		SelectionConnection ds=new SelectionConnection();
		ArrayList<ControlDemo> arraylist=new ArrayList();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
			 st=con.createStatement();
			String sql="select * from departments";
			
			PreparedStatement p=con.prepareStatement(sql);
			ResultSet s=p.executeQuery();
			while (s.next()){		
				int id1=s.getInt(1);
				String dname=s.getString(2);
				
				ControlDemo student=new ControlDemo(id1, dname);
				
				arraylist.add(student);
			}
			con.close();

			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return arraylist;
	}
	
	
public ArrayList<ControlDemo> fetchDataCourse() {
		SelectionConnection ds=new SelectionConnection();
		ArrayList<ControlDemo> arraylist=new ArrayList();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
			 st=con.createStatement();
			String sql="select * from Courses";
			
			PreparedStatement p=con.prepareStatement(sql);
			ResultSet s=p.executeQuery();
			while (s.next()){		
				int cid=s.getInt(1);
				String cname=s.getString(2);
				int credits=s.getInt(3);
				int did=s.getInt(4);
				ControlDemo student=new ControlDemo(cid, cname,credits,did);
				
				arraylist.add(student);
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return arraylist;
	}
	
public ArrayList<ControlDemo> fetchDataVideo() {
	
	ArrayList<ControlDemo> arraylist=new ArrayList();
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
		 st=con.createStatement();
		String sql="SELECT videoID,CourseID,VideoTitle,REPLACE(SUBSTRING(TRIM(VideoURL), 18), ' ', ''),UploadDate FROM CollegeDB.CourseVideos;";
//		String sql="select * from CourseVideos";
		SelectionConnection ds=new SelectionConnection();
		PreparedStatement p=con.prepareStatement(sql);
		ResultSet s=p.executeQuery();
		while (s.next()){		
			int vid=s.getInt(1);
			int cid=s.getInt(2);
			String vtitle=s.getString(3);
			String url=s.getString(4);
			String date=s.getString(5);
			ControlDemo student=new ControlDemo(vid,cid,vtitle,url,date);
			
			arraylist.add(student);
		}
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	return arraylist;
}



public ArrayList<ControlDemo> fetchDataFacultyAssigned() {
	
	ArrayList<ControlDemo> arraylist=new ArrayList();
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
		st=con.createStatement();

		String sql="select a.assignmentid,concat(f.firstname,\" \",f.lastname)as 'faculty name',a.assignmentDAte,c.CourseName from faculty f natural  join TeachingAssignments a natural join  courses c ; ";
//		String sql="select * from CourseVideos";
		SelectionConnection ds=new SelectionConnection();
		PreparedStatement p=con.prepareStatement(sql);
		ResultSet s=p.executeQuery();
		while (s.next()){		
			int id=s.getInt(1);
			String fname=s.getString(2);
			String adate=s.getString(3);
			String cname=s.getString(4);
			ControlDemo student=new ControlDemo(id,fname,adate,cname);
			arraylist.add(student);
		}
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	return arraylist;
}

public ArrayList<ControlDemo> fetchDataFaculty() {
	
	ArrayList<ControlDemo> arraylist=new ArrayList();
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
		 st=con.createStatement();
		SelectionConnection ds=new SelectionConnection();
		String sql="SELECT f.facultyid ,concat(f.firstname,\" \",f.lastname) as 'faculty name',f.dateofbirth,f.gender,f.email,d.departmentname FROM CollegeDB.Faculty f natural join departments d;";
		
		PreparedStatement p=con.prepareStatement(sql);
		ResultSet s=p.executeQuery();
		while (s.next()){		
			int id=s.getInt(1);
			String fname=s.getString(2);
			String dob=s.getString(3);
			String gender=s.getString(4);
			String email=s.getString(5);
			String dname=s.getString(6);
			
			ControlDemo student=new ControlDemo(id,fname,dob,gender,email,dname);
			arraylist.add(student);
		}
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	return arraylist;
}


public ArrayList<ControlDemo> fetchDataStudent() {
	
	ArrayList<ControlDemo> arraylist=new ArrayList();
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CollegeDB","root","varun@2003");
		 st=con.createStatement();

		String sql="SELECT f.studentid ,concat(f.firstname,\" \",f.lastname) as 'faculty name',f.dateofbirth,f.gender,f.email,d.departmentname FROM CollegeDB.students f natural join departments d;";
		SelectionConnection ds=new SelectionConnection();
		PreparedStatement p=con.prepareStatement(sql);
		ResultSet s=p.executeQuery();
		while (s.next()){		
			int id=s.getInt(1);
			String fname=s.getString(2);
			String dob=s.getString(3);
			String gender=s.getString(4);
			String email=s.getString(5);
			String dname=s.getString(6);
			
			ControlDemo student=new ControlDemo(id,fname,dob,gender,email,dname);
			arraylist.add(student);
		}
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	return arraylist;
}


		
	//public static void main(String[] args) {
	//	SelectionConnection ds=new SelectionConnection();
	//	ArrayList<ControlDemo> d=s.fetchDataCourse();
	//	for (ControlDemo c : d) {
	//		System.out.println(c.getCid());
	//		System.out.println(c.getCname());
	//		
	//	}
	
}

