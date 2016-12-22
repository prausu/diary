<%@ page contentType = "text/html; charset=euc-kr" %>
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
	String sessionID=(String)session.getAttribute("sessionId");
	boolean loginOK = sessionID == null ? false : true;

	if(loginOK){
%>			
		<img src="image/welcome.png" border="0" width="50%"> <br>
		환영합니다 원하는 곳으로 이동하세요
<%	
	}
	else
	{
%>	

		<img src="image/secret.jpg" border="0" width="50%"> <br>
		이 홈페이지는 인증된 사용자만 사용이 가능합니다 회원 가입 또는 로그인을 해주세요

<%	
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
