<%@page import="java.sql.*,java.util.*,java.io.*,javax.swing.*"%>

<html>
<head>
	
</head>
<body>
<center>
<h1 style="font-size:50px; font-family: Arial; text-align: center;">Hockey League </h1>
<% 
String SUBMIT_PREFIX = "submit_";
String value ="";
  for (Enumeration e = request.getParameterNames(); e.hasMoreElements();) {
    String key = (String) e.nextElement();
    if (key.startsWith(SUBMIT_PREFIX)) {
      value = key.substring(SUBMIT_PREFIX.length());
      request.setAttribute("submit", value);
      break;
    }
  }
  out.println("Edit for "+value);
  String id = "";
  String Address ="";
  String playerName ="";
  String playerRole = "";
  String status = "";
  String teamName = "";
try{
			
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			String Query="SELECT * FROM players WHERE playerName = '"+value+"'";
			
			ResultSet rs=st.executeQuery(Query);
			if (rs.next( ) ) {
			playerName = rs.getString("playerName");
			Address = rs.getString("playerAddress");
			playerRole = rs.getString("playerRole");
			status = rs.getString("playerActiveStatus");
			id = rs.getString("teamID");	
			}
			st.close();
			con.close();
}
catch(Exception ex){
			
			ex.printStackTrace();
			  
		}

try{
			
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/dbhockeyleague";
			Connection con=DriverManager.getConnection(url,"root","root");
			Statement st=con.createStatement();
			String Query="SELECT teamName FROM teams WHERE TeamID = '"+id+"'";
			ResultSet rs=st.executeQuery(Query);
			if (rs.next( ) ) {
			teamName =rs.getString("teamName");		
			}
			st.close();
			con.close();
}
catch(Exception ex){
			
			ex.printStackTrace();
			  
		}
%>
<form id ="myfrm">
Name <input type="text" name="Name" value='<%=playerName%>'>
<br>Address <input type="text" name="Address" value='<%=Address%>'>
<br> 
<label for="Team">Team </label>
  <select name="Team" id="Team" value='<%=teamName%>' >
    <option value="red" name ="red" <% if((teamName).equals("red")){%> selected <%}%> >red</option>
    <option value="blue" name = "blue" <% if((teamName).equals("blue")){%> selected <%}%> >blue</option>
	
  </select>
  <br>
  <label for="Role">Role </label>
  <select name="Role" id="Role"  >
    <option value="Defense" name ="Defense" <% if((playerRole).equals("Defense")){%> selected <%}%> >Defense</option>
    <option value="Attack" name = "Attack" <% if((playerRole).equals("Attack")){%> selected <%}%> >Attack</option>
	
  </select>
<br>
Active <input type="checkbox" id="vehicle1" name="Active" value=<%=("T".equals(status)?"T":"N")%> <%=("T".equals(status)?"checked":"")%> >
<br>
<input type="submit" value="Save" onclick = "{document.getElementById('myfrm').action = 'Update.jsp';}">
<br>
<input type="hidden" name="userId" value="<%out.println(playerName);%>">
<input type="submit" value="Cancel" onclick = "{document.getElementById('myfrm').action = 'Index.html';}"  >
</form>

<br>

</center>
</body>
</html>