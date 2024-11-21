package onlineCorse.Controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlineCorse.sqlControl.sqlconnect;

@WebServlet(value="/add")
public class InsertStudentControl extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int departmentId = Integer.parseInt(request.getParameter("department"));
//        System.out.print(dob);
        sqlconnect control = new sqlconnect();
        boolean success = control.InsertStudent(firstName, lastName, dob, gender, email, password, departmentId);

        if (success) {
            response.sendRedirect("Success.jsp"); 
        	
        } else {
            response.sendRedirect("Error.jsp"); // Redirect to an error page
        }
		
	}

}
