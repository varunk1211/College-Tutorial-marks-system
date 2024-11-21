package onlineCorse.Controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlineCorse.sqlControl.sqlconnect;

@WebServlet(value="/goto")
public class InsertVideoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		        String title = request.getParameter("title");
		        String url = request.getParameter("url");
		        String uploadDate = request.getParameter("uploadDate");
		        int courseId = Integer.parseInt(request.getParameter("course"));

		        // Example of using Connectivity class to add video to database
		       sqlconnect control = new sqlconnect();
		        boolean success = control.InsertVideo( courseId,title,url, uploadDate);

		        if (success) {
		            response.sendRedirect("Success.jsp"); // Redirect to a success page
		        } else {
		            response.sendRedirect("Error.jsp"); // Redirect to an error page
		        }
	}

}
