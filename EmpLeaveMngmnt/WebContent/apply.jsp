<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%
int id=(Integer)session.getAttribute("id");
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("semail");
int phone=(Integer)session.getAttribute("phone");
String address=(String)session.getAttribute("address");
String jobRole=(String)session.getAttribute("jobRole");
String shift=(String)session.getAttribute("shift");
String date=request.getParameter("date");
String leave=request.getParameter("no._leave");
int no_leave=Integer.parseInt(leave);

ps=con.prepareStatement("insert into empleave(eid ,name,email ,phone, address ,jobrole ,shift ,date ,noleave)values(?,?,?,?,?,?,?,?,?)");
ps.setInt(1,id);
ps.setString(2,name);
ps.setString(3,email);
ps.setInt(4,phone);
ps.setString(5,address);
ps.setString(6,jobRole);
ps.setString(7,shift);
ps.setString(8,date);
ps.setInt(9,no_leave);
int x=ps.executeUpdate();
if(x!=0){
	
	response.sendRedirect("apply_leave.html?msg=Leave Applied");
}
%>