<%@include file="connect.jsp"%>
<%
String mname=(String) session.getAttribute("name");
int id=Integer.parseInt(request.getParameter("id"));
String sql = "update empleave set status=?,mname=? where id=?";
ps = con.prepareStatement(sql);
ps.setString(1, "Accepted");
ps.setString(2, mname);
ps.setInt(3, id);
int a = ps.executeUpdate();
	if (a != 0)
		response.sendRedirect("leaveReq.jsp?msg=accepted");

%>
