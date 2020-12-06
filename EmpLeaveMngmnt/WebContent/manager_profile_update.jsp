<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String email=request.getParameter("email");

int phone=Integer.parseInt(request.getParameter("phone"));
String address=request.getParameter("address");
ps=con.prepareStatement("update manager set name=?, email=?, phone=?,address=? where id=? ");
ps.setString(1,name);
ps.setString(2,email);
ps.setLong(3,phone);
ps.setString(4,address);
ps.setInt(5,id);
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("manager_profile.jsp?msg=Updated");
%>