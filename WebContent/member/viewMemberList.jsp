<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head><title>회원 목록</title></head>
<body>

MEMBER 테이블의 내용
<table width="100%" border="1">
<tr>
	<td>USER_ID</td><td>LOGIN_ID</td><td>PASSWORD</td><td>NICKNAME</td><td>JOIN_DATE</td>
</tr>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811" +
							"?useUnicode=true&characterEncoding=euckr";
		String dbUser = "s201245811";
		String dbPass = "201245811";
		
		String query = "select * from MEMBER order by JOIN_DATE";
		
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs.next()) {
%>
<tr>
	<td><%= rs.getString("USER_ID") %></td>
	<td><%= rs.getString("LOGIN_ID") %></td>
	<td><%= rs.getString("PASSWORD") %></td>
	<td><%= rs.getString("NICKNAME") %></td>
	<td><%= rs.getString("JOIN_DATE") %></td>
</tr>
<%
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</table>

</body>
</html>
