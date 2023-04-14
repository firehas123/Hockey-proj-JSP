<%@page import="java.sql.*,java.util.*"%>

<html>
<head>
	<title>SimpleBean Test Page</title>
</head>
<body>

<%-- Creating JavaBeans --%>


	
	
	<% 
	String name = request.getParameter("Name");
	String Address = request.getParameter("Address");
	String Role = request.getParameter("Role");
	String Team=request.getParameter("Team");
		if(Team.equals("red"))
		Team = "1";
		else
		Team ="2";
	String check =request.getParameter("Active"); 

%>

	<% 
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			String query="insert into players(playerName,playerAddress,teamID,playerRole,PlayerActiveStatus) values('"+name+"', '"+Address+"' ,"+Team+" ,'"+Role+"','"+check+"')";
			int rs = st.executeUpdate(query);
			if(rs==1){
				
				out.println("Successfully Inserted");
				
			}
			else{
				
				out.println("Not Inserted");
			}
	 }catch(Exception ex){
			
			ex.printStackTrace();
			  
		}	
	%>
</p>
<br>
<input type="submit" value="Back To Main" onclick="location.href='Index.html';"  >
</body>
</html>