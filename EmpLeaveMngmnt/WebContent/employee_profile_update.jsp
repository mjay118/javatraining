<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String email=request.getParameter("email");

int phone=Integer.parseInt(request.getParameter("phone"));
String address=request.getParameter("address");
String jobRole=request.getParameter("job-role");
String shift=request.getParameter("shift");
ps=con.prepareStatement("update emp set name=?, email=?, phone=?,address=?,jobrole=?,shift=? where id=? ");
ps.setString(1,name);
ps.setString(2,email);
ps.setLong(3,phone);
ps.setString(4,address);
ps.setString(5,jobRole);
ps.setString(6,shift);
ps.setInt(7,id);
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("employee_profile.jsp?msg=Updated");
%>