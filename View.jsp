<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Information</title>
<style>
ul { 
	display: inline-block; 
	text-align: left; 
	}
div.parent {
	text-align: center;
	}
</style>
</head>

<%@ page language = "java" import = "java.io.*,java.sql.*,javax.swing.*" %>


<body>
<h1 style="font-size:50px; font-family: Arial; text-align: center;">Hockey League </h1>
<center>
<form id = "myfrm" action="" method = "get">
<div class="parent">
<ul >
<%
String value = request.getParameter("Team");
try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();

		if(value.equals("Red"))
			out.println("RED TEAM");
		else
			out.println("BLUE TEAM");
		
		String Query="SELECT playerName FROM players WHERE teamID = (SELECT teamID FROM teams WHERE teamName =  '"+value+"')";
		ResultSet rs=st.executeQuery(Query);
		String s;
		String b = "button";
		int i=0;
		if(value.equals("Red"))
	   {
		while(rs.next())
		{
			s = rs.getString("playerName");

%>


<br/>
<li> <% 
out.println(s); 

%>
<button value="edit" name="<%="submit_"+s%>" onclick = "{document.getElementById('myfrm').action = 'edit.jsp';}"> <i class="fa fa-pencil"></i></button>
<button value="edit" name="<%="submit_"+s%>" onclick = "{document.getElementById('myfrm').action = 'del.jsp';}"> <i class="fa fa-trash"></i></button>
 
 
</li>
<%
i++;
}
	}
	else{
while(rs.next())
		{
			s = rs.getString("playerName");


 %>
 <li> <% 
out.println(s); 
%>
<button value="edit" name="<%="submit_"+s%>" onclick = "{document.getElementById('myfrm').action = 'edit.jsp';}"> <i class="fa fa-pencil"></i></button>
<button value="edit" name="<%="submit_"+s%>" onclick = "{document.getElementById('myfrm').action = 'del.jsp';}">  <i class="fa fa-trash"></i></button>
</li>
<% 

		}
	}
%>
</ul>

</div>
</form>
<%
con.close();
%>

<%
}catch(Exception ex){
	ex.printStackTrace();
	} 

%>
<div>
<input type="submit" value="Add Player" onclick="location.href='AddPlayer.html';">
<input type="submit" value="Cancel" onclick="location.href='Index.html';">
</div>
</center>
</body>
</html>