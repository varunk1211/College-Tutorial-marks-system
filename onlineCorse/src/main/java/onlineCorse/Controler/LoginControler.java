package onlineCorse.Controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onlineCorse.DatabasConnect.Connectivity;

@WebServlet(value="/log")
public class LoginControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 PrintWriter out=response.getWriter();
    	 
 		String email=request.getParameter("email");
 		String password=request.getParameter("password");
 		String radio=request.getParameter("radio");
 		Connectivity control=new Connectivity();
 		 HttpSession session = request.getSession();
 		switch(radio) {
 		
	 			case "user":{String check=control.user(email,password);
	 					if( check!=null) {
	 						
	 					
	 				        // Set session attributes
	 				        session.setAttribute("name",check);
	 				        session.setAttribute("user","user");
	 							RequestDispatcher res=request.getRequestDispatcher("FrontAdmin.jsp");
	 							res.forward(request,response);	
	 						}
	 					else {
	 						response.sendRedirect("login.jsp");
	 						}
	 					break;
	 				}	
	 			
	 			case "admin":{
	 				String check1=control.admine(email,password);
	 				if( check1!= null) {
	 					session.setAttribute("name",check1);
	 					session.setAttribute("user","admin");
	 					System.out.println(check1);
	 					RequestDispatcher res=request.getRequestDispatcher("AdminLogin.jsp");
	 					res.forward(request,response);	
	 				}
	 				else {
	 					response.sendRedirect("login.jsp");
	 				}
	 			break;	
	 			}
 		}	
	}
 		

}
