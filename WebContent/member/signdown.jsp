<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*"%>
<%
 String sessionID=(String)session.getAttribute("sessionId");
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection conn = null;
 PreparedStatement insert = null;
 
try {
  String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811?"+
       "useUnicode=true&characterEncoding=euckr";
      
  String dbUser = "s201245811";
  String dbPass = "201245811";
  conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
  
  insert = conn.prepareStatement("delete from MEMBER where LOGIN_ID=?");
  insert.setString(1,sessionID);
  insert.executeUpdate();
} finally {
	  if (insert != null) try { insert.close(); } catch(SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch(SQLException ex) {}
 }
	session.invalidate();
 %>
		<script>
		alert("È¸¿ø Å»ÅðµÇ¾ú½À´Ï´Ù");
		</script>
<%
	response.sendRedirect("../main.jsp");
%> 
