<!DOCTYPE html>
<html>

<body bgcolor="salmon">
<br><br><br>
<center><h1>YOUR PROFILE DETAILS</h1></center>
<br><br><br>
<center>
<a href="employee_home.html">Home |</a>
<a href="employee_profile.jsp">Profile |</a>

<a href="apply_leave.html">Apply Leave |</a>
<a href="index.html">LogOut | </a>

</center>
<br><br><br>
<%@ page import="java.sql.*" %>
<center><table border=1 width=20% height=20%>
<tr><td>Id</td><td>Name</td><td>Email</td><td>Phone</td><td>Address</td><td>Job Role</td><td>Shift</td></tr>
<%
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/empMngmnt";
String uname = "root";
String pass = "1234";
con = DriverManager.getConnection(url, uname, pass);
int id=(Integer)session.getAttribute("id");
ps=con.prepareStatement("select * from emp where id=?");
ps.setInt(1, id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("id") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getInt("phone") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("jobrole") %></td>
<td><%=rs.getString("shift") %></td>
<td><a href="update_employee_profile.jsp?id=<%=rs.getInt(1)%>">Update</a></td>
</tr>
<%} %>
</table>
</center>
</body>
</html>