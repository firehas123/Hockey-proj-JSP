<%@page import="java.sql.*,java.util.*,java.io.*,javax.swing.*"%>

<html>
<head>
	<title></title>
</head>
<body>




	
	
	<% 
	String Actualname = request.getParameter("userId"); 
	Actualname = Actualname.substring(0, Actualname.length() - 2);
	String name = request.getParameter("Name");
	String Address = request.getParameter("Address");
	String Role = request.getParameter("Role");
	String Team=request.getParameter("Team");
		if(Team.equals("red"))
		Team = "1";
		else
		Team ="2";
	String check =request.getParameter("Active"); 
	if(check == null)
	check ="N";
	int PID= 0;
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			String query="SELECT PlayerID FROM players WHERE playerName = '"+Actualname+"'";
			ResultSet rs=st.executeQuery(query);
			if (rs.next( ) ) {
			PID = (int)rs.getInt("PlayerID");		
			}
			
			out.println("Successful");
	 }catch(Exception ex){
			
			ex.printStackTrace();
		}	
		
		
		
		
		
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			String query="UPDATE players SET playerName = '"+name+"', playerAddress = '"+Address+"' , teamID = '"+Team+"', playerRole = '"+Role+"' , playerActiveStatus = '"+check+"'  WHERE playerID = '"+PID+"' ";
			int rs =st.executeUpdate(query);
			
			
			
	 }catch(Exception ex){
			
			ex.printStackTrace();
		}	
		
%>

	
</p>
<br>
<input type="submit" value="Back To Main" onclick="location.href='Index.html';"  >
</body>
</html>