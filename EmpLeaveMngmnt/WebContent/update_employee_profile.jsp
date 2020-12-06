<!DOCTYPE html>
<html>

<body bgcolor="salmon">
<br><br><br>
<center><h1>UPDATE YOUR PROFILE DETAILS</h1></center>
<br><br><br>
<center>
<a href="employee_home.html">Home |</a>
<a href="employeer_profile.jsp"> Profile |</a>
<a href="index.html">LogOut |</a>
</center>
<br><br><br>
<%@ page import="java.sql.*" %>
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
if(rs.next()){
%>
<form action="./employee_profile_update.jsp" align="center" >
<input type="hidden" name="id" value="<%=rs.getInt("id") %>"><br><br>
<input type="text" name="name" value="<%=rs.getString("name") %>"><br><br>
<input type="email" name="email" value="<%=rs.getString("email") %>"><br><br>
<input type="number" name="phone" value="<%=rs.getInt("phone") %>"><br><br>
<input type="text" name="address" value="<%=rs.getString("address") %>"><br><br>

<select name="job-role" ><br><br>
<option value="<%=rs.getString("jobrole")%>"><%=rs.getString("jobrole") %></option>
<option value="Ass. Software Engg.">Ass. Software Engg.</option>
<option value="Software Engg.">Software Engg.</option>
<option value="Accountant">Accountant</option>
<option value="Hr">Hr</option>
<option value="Tester">Tester</option>

</select><br><br>
<select name="shift" ><br><br>
<option value="<%=rs.getString("shift")%>"><%=rs.getString("shift") %></option>
<option value="Day">Day</option>
<option value="Night">Night</option>

</select><br><br>
<input type="submit" value="update">
</form>
<%}%>