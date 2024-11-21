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

@WebServlet(value ="/showallvideo")
public class ShowVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SelectionConnection c=new SelectionConnection();
		ArrayList<ControlDemo> vidlist=c.fetchDataVideo();
		if(vidlist.isEmpty()) {
				RequestDispatcher r=req.getRequestDispatcher("error.jsp");
				r.forward(req, resp);	
		}
		else{
			req.setAttribute("vidList", vidlist);

	        RequestDispatcher r = req.getRequestDispatcher("ShowLeaturesd.jsp");
	        r.forward(req, resp); 
		}
				
		
		
	}



}
