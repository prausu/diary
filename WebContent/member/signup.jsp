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
<form action="<%=request.getContextPath()%>/member/signupParameter.jsp" method="post">

<table border="0" width="300" height="100">
<tr>
 <td>���̵�</td>
 <td><input type="text" name="id" size="5"></td>
</tr>
<tr>
 <td>��й�ȣ</td>
 <td><input type="password" name="password" size="5"></td>
</tr>
<tr>
 <td>��й�ȣ ��Ȯ��</td>
 <td><input type="password" name="password2" size="5"></td>
</tr>
<tr>
 <td>�г���</td>
 <td><input type="text" name="name" size="5"></td>
</tr>
<tr>
 <td></td>
 <td><input type="submit" value="ȸ������"></td>
</tr>
</table> 

</form>

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
