<!DOCTYPE html>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
 
<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="memberInfo" class="hw.member.MemberInfo" />
<jsp:setProperty name="memberInfo" property="*" />

<%
	String LOGIN_ID = memberInfo.getId();
	String PASSWORD = memberInfo.getPassword();
	String PASSWORD2 = memberInfo.getPassword2();
	String NICKNAME = memberInfo.getName();

	
	SimpleDateFormat formatter = new SimpleDateFormat ( "YYYY-MM-dd HH:mm:ss", Locale.KOREA );
	Date current = new Date();
	String DATE = formatter.format ( current );


if(!PASSWORD.equals(PASSWORD2))
{
%>
		<script>
		alert("패스워드와 패스워드 재확인이 다릅니다");
		history.go(-1);
		</script>
<%	
}
else
{

	Connection conn = null;
	PreparedStatement pstmtItem = null;
	PreparedStatement pstmtDetail = null;

		String jdbcDriver = "jdbc:mysql://koers.asuscomm.com/s201245811" +
							"?useUnicode=true&characterEncoding=euckr";
		String dbUser = "s201245811";
		String dbPass = "201245811";
	
	Throwable occuredException = null;
	
	try {

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		conn.setAutoCommit(false);
		
		pstmtItem = conn.prepareStatement("insert into MEMBER(LOGIN_ID, PASSWORD, NICKNAME, JOIN_DATE) values (?,?,?,?)");
		pstmtItem.setString(1, LOGIN_ID);
		pstmtItem.setString(2, PASSWORD);
		pstmtItem.setString(3, NICKNAME);
		pstmtItem.setString(4, DATE);
		pstmtItem.executeUpdate();
		
		conn.commit();

	} catch(Throwable e) {
		if (conn != null) {
			try {
				conn.rollback();
			} catch(SQLException ex) {}
		}
		occuredException = e;
	} 
	finally {
        if (pstmtItem != null) try { pstmtItem.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
	

	<script language=javascript>
   self.window.alert("회원 가입되었습니다");
   location.href="../main.jsp"; 
   </script>


<html>
<head><title>회원가입 처리</title></head>
<body>
<%  if (occuredException != null) { %>
에러가 발생하였슴: <%= occuredException.getMessage() %>
<%  } else { %>
데이터가 성공적으로 들어감
<%  } 
}%>
</body>
</html>