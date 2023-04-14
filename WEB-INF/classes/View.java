import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class View extends HttpServlet {
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();
	// this will view data

    //String name=request.getParameter("name");
    //String address=request.getParameter("address");

    out.println("<html>");
    out.println("<head><title>Response</title>");
	out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
	out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">");
	out.println("</head>");
    out.println("<body bgcolor=\"#ffffff\">");
	out.println("<h1 style=\"font-size:50px; font-family: Arial; text-align: center;\">Hockey League </h1>");
	String value = request.getParameter("Team");
	
	
		   try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			
	if(value.equals("Red"))
		out.println("RED TEAM");
	else // team is blue
		out.println("BLUE TEAM");
		
			out.println("<ul>");
			String Query="SELECT playerName FROM players WHERE teamID = (SELECT teamID FROM teams WHERE teamName =  '"+value+"')";
			ResultSet rs=st.executeQuery(Query);
			String s; // for storing name retrieved from DB	
		
	if(value.equals("Red"))
	{
		while(rs.next())
		{
			s = rs.getString("playerName");
			out.println("<li>"+ s +"</li>  <input type=\"image\" src=\"data:image/png;base64,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\"  width=\"25\" height=\"25\" name =\"nono\" value = \""+s+"\" onclick=\"window.location.href='edit.jsp';\"> ");
			
		}

	}
	else // team is blue
	{
		while(rs.next())
		{
			s = rs.getString("playerName");
			out.println("<li>"+ s +"</li>  <input type=\"image\" src=\"data:image/png;base64,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\"  width=\"25\" height=\"25\" name =\"nono\" id =\"nono\" value = \""+s+"\" onclick=\"window.location.href='edit.jsp';\"> ");
		}
	}
	out.println("</ul>");

	 }catch(Exception ex){
			
			ex.printStackTrace();
			  
		}
		// 2 buttons here
		out.println("<div>");
		
		
		out.println("<input type=\"submit\" value=\"Add Player\" onclick=\"location.href='AddPlayer.html';\">");
		
		
		out.println("<input type=\"submit\" value=\"Cancel\" onclick=\"location.href='Index.html';\">");
		
		
	out.println("</body></html>");

   

  }
   

}
