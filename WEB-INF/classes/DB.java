import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class DB extends HttpServlet {
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	// get PrintWriter object
	PrintWriter out = response.getWriter();
	// this will view data

    out.println("<html>");
    out.println("<head><title>Response</title></head>");	
	out.println("</body></html>");

   

  }

}
