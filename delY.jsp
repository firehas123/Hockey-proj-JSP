<%@page import="java.sql.*,java.util.*,java.io.*,javax.swing.*"%>

<html>
<head>
	
</head>
<body>
<center>
<h1 style="font-size:50px; font-family: Arial; text-align: center;">Hockey League </h1>
<% 
   String name = request.getParameter("userId"); 
        name = name.substring(0, name.length() - 2);

try{
			
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			
			String sql = "delete from players where playerName = '"+name+"'";
			st.executeUpdate(sql);
				
				out.println("Player Deleted");
				
			
			
    
			con.close();
}
catch(Exception e){
			
			e.printStackTrace();
			  
		}


%>

<input type="submit" value="Back To Main" onclick="location.href='Index.html';"  >
</center>
</body>
</html>