<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page session = "true" %>
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

	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");

    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811?" +
							"useUnicode=true&characterEncoding=euckr";
		String dbUser = "s201245811";
		String dbPass = "201245811";

        String query = "select LOGIN_ID , PASSWORD , NICKNAME from MEMBER where LOGIN_ID ='"+ID+"' and PASSWORD = '"+PW+"'";
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.createStatement();

		rs = stmt.executeQuery(query);

		if( rs.next() ) {
			session.setAttribute("sessionId",rs.getString("NICKNAME"));
			session.setMaxInactiveInterval(1000);
			response.sendRedirect(request.getContextPath()+"/main.jsp");
        } 
		else {
%>
		<script>
		alert("아이디 혹은 비밀번호가 잘못되었습니다.");
		history.go(-1);
		</script>		
<%
        }
    } catch(SQLException ex) {
%>
에러 발생: <%= ex.getMessage() %>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>


