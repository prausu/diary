<%@ page contentType = "text/html; charset=euc-kr" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page session = "true" %>

<html>
<head><title>김현일의 SECRET DIARY</title></head>
<body>

<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>
		<jsp:include page="/layout_top.jsp" flush="false" />
	</td>
</tr>
<tr>
	<td valign="top">
		<!-- 내용 부분: 시작 -->

 
<%

 String ID=(String)session.getAttribute("sessionId");

    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811?" +
							"useUnicode=true&characterEncoding=euckr";
		String dbUser = "s201245811";
		String dbPass = "201245811";
		
		String query = "select * from MEMBER where LOGIN_ID ='"+ID+"'"; 
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.createStatement();
        
        rs = stmt.executeQuery(query);
        if( rs.next() ) {
%>
 
<form action="<%=request.getContextPath()%>/member/viewMemberparameter.jsp" method="post">
<table border="0" width="400">
<tr>
 <td>아이디</td>
 <td><input type="text" name="LOGIN_ID" value="<%= rs.getString("LOGIN_ID")%>"size="20" ></td>
</tr>
<tr>
 <td>닉네임</td>
 <td><input type="text" name="NICKNAME" value="<%= rs.getString("NICKNAME")%>"size="20" ></td>
</tr>
<tr>
 <td>패스워드</td>
 <td><input type="text" name="PASSWORD" value="<%= rs.getString("PASSWORD")%>"size="20" ></td>
</tr>
<tr>
 <td>회원가입일시</td>
 <td><input type="text" name="JOIN_DATE" value="<%= rs.getString("JOIN_DATE")%>"size="20" ></td>
</tr>
<tr>
 <td></td>
 <td><input type="submit" value="정보수정"></td>
</tr>
<tr>
 <td></td>
 <td><input type="button" value="회원탈퇴" onClick="window.location='signdown.jsp'"/></td>
</tr>
</table> 
</form>

<%
        } else {
%>
<%= ID %>에 해당하는 정보가 존재하지 않습니다.
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
		<!-- 내용 부분: 끝 -->
	</td>
</tr>
<tr>
	<td >
		<jsp:include page="/layout_bottom.jsp" flush="false" />
	</td>
</tr>

</table>

</body>
</html>
