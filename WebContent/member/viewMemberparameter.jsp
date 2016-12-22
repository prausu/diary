<%@ page contentType="text/html; charset=euc-kr" %>
 
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
 
<%
    request.setCharacterEncoding("euc-kr");
    
    String BeforeID =(String)session.getAttribute("sessionId");
 
	String LOGIN_ID = 	request.getParameter("LOGIN_ID");
	String PASSWORD = 	request.getParameter("PASSWORD");
	String NICKNAME = 	request.getParameter("NICKNAME");
    String JOIN_DATE = 	request.getParameter("JOIN_DATE");
 %>
 
 <%
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
 
    try {
        String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811?" +
							"useUnicode=true&characterEncoding=euckr";
		String dbUser = "s201245811";
		String dbPass = "201245811";
                
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    	pstmt = conn.prepareStatement("UPDATE MEMBER set LOGIN_ID=?, PASSWORD=?, NICKNAME=?, JOIN_DATE =? where LOGIN_ID=?");
	
        pstmt.setString(1, LOGIN_ID);
        pstmt.setString(2, PASSWORD);
		pstmt.setString(3, NICKNAME);
        pstmt.setString(4, JOIN_DATE);
		pstmt.setString(5, BeforeID);
        
        pstmt.executeUpdate();
 
%>

	<script language=javascript>
   self.window.alert("회원 정보가 수정되었습니다");
   location.href="../main.jsp"; 
   </script>
		
<%
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>

<html>
<body>
 	viewMemberparameter 수행
</body>
</html>