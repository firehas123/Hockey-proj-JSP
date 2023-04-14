<%@page import="java.sql.*,java.util.*,java.io.*,javax.swing.*"%>

<html>
<head>
	
</head>
<body>
<form id = "myfrm" method="post"> 
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
  out.println("Delete Player "+value);
  session.setAttribute("userId",value);
  %>
  <br>
  <%
  out.println("Are you sure you want to delete this player?");
  %>
  <br>
 <input type="hidden" name="userId" value="<%out.println(value);%>">
<input type="submit" value="Delete" onclick = "{document.getElementById('myfrm').action = 'delY.jsp';}">
<input type="submit" value="Cancel" onclick = "{document.getElementById('myfrm').action = 'Index.html';}">
</form>
</center>
</body>
</html>