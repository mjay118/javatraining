<!DOCTYPE html>
<html>

<body bgcolor="salmon">
<br><br><br>
<center><h1>YOUR PROFILE DETAILS</h1></center>
<br><br><br>
<center>
<a href="leaveReq.jsp">Leave Request | </a>
<a href="manager_profile.jsp"> Profile |</a>

<a href="manager_home.html">Home |</a>
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
ps=con.prepareStatement("select * from manager where id=?");
ps.setInt(1, id);
ResultSet rs=ps.executeQuery();
if(rs.next()){
%>
<form action="./manager_profile_update.jsp" align="center" >
<input type="hidden" name="id" value="<%=rs.getInt("id") %>"><br><br>
<input type="text" name="name" value="<%=rs.getString("name") %>"><br><br>
<input type="email" name="email" value="<%=rs.getString("email") %>"><br><br>

<input type="number" name="phone" value="<%=rs.getInt("phone") %>"><br><br>
<input type="text" name="address" value="<%=rs.getString("address") %>"><br><br>

<input type="submit" value="update">
</form>
<%}%>