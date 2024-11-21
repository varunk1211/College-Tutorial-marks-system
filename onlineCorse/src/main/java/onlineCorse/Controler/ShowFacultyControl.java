package onlineCorse.Controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlineCorse.DatabasConnect.ControlDemo;
import onlineCorse.sqlControl.SelectionConnection;

@WebServlet(value ="/asdf")
public class ShowFacultyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SelectionConnection c=new SelectionConnection();
		ArrayList<ControlDemo> facList=c.fetchDataFaculty();
		if(facList.isEmpty()) {
				RequestDispatcher r=req.getRequestDispatcher("Error.jsp");
				r.forward(req, resp);	
		}
		else{
			req.setAttribute("facList", facList);
	        RequestDispatcher r = req.getRequestDispatcher("ShowFacultyDetails.jsp");
	        r.forward(req, resp); 
		}
	}
}
