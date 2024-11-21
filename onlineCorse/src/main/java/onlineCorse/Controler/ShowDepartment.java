package onlineCorse.Controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import onlineCorse.DatabasConnect.ControlDemo;
import onlineCorse.sqlControl.SelectionConnection;
@WebServlet(value ="/showdep")
public class ShowDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		SelectionConnection c=new SelectionConnection();
		ArrayList<ControlDemo> deplist=c.fetchDataDepartment();
		if(deplist.isEmpty()) {
				RequestDispatcher r=req.getRequestDispatcher("error.jsp");
				r.forward(req, resp);	
		}
		else{
			req.setAttribute("depList", deplist);

	        RequestDispatcher r = req.getRequestDispatcher("InsertStudents.jsp");
	        r.forward(req, resp); 
		}
				

	}

}
