package onlineCorse.Controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlineCorse.sqlControl.sqlconnect;
@WebServlet(value = "/Inse")
public class InsertCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cname=request.getParameter("cname");
		int credits= Integer.parseInt(request.getParameter("credits"));
		int did= Integer.parseInt(request.getParameter("did"));
		sqlconnect s=new sqlconnect();
		Boolean success=s.InsertCourse(cname, credits, did);
		if (success) {
            response.sendRedirect("Success.jsp"); // Redirect to a success page
        } else {
            response.sendRedirect("Error.jsp"); // Redirect to an error page
        }
		
	}
}
