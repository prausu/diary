<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page session = "true" %>

<html>
<head><title>�������� SECRET DIARY</title></head>
<body>

<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>
		<jsp:include page="/layout_top.jsp" flush="false" />
	</td>
</tr>
<tr>
	<td valign="top">
		<!-- ���� �κ�: ���� -->
<%
	String sessionID=(String)session.getAttribute("sessionId");
	boolean loginOK = sessionID == null ? false : true;

	if(loginOK){
%>			
		<img src="image/welcome.png" border="0" width="50%"> <br>
		ȯ���մϴ� ���ϴ� ������ �̵��ϼ���
<%	
	}
	else
	{
%>	

		<img src="image/secret.jpg" border="0" width="50%"> <br>
		�� Ȩ�������� ������ ����ڸ� ����� �����մϴ� ȸ�� ���� �Ǵ� �α����� ���ּ���

<%	
	}
%>	
	
		<!-- ���� �κ�: �� -->
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
