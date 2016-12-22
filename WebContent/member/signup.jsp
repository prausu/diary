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
<form action="<%=request.getContextPath()%>/member/signupParameter.jsp" method="post">

<table border="0" width="300" height="100">
<tr>
 <td>아이디</td>
 <td><input type="text" name="id" size="5"></td>
</tr>
<tr>
 <td>비밀번호</td>
 <td><input type="password" name="password" size="5"></td>
</tr>
<tr>
 <td>비밀번호 재확인</td>
 <td><input type="password" name="password2" size="5"></td>
</tr>
<tr>
 <td>닉네임</td>
 <td><input type="text" name="name" size="5"></td>
</tr>
<tr>
 <td></td>
 <td><input type="submit" value="회원가입"></td>
</tr>
</table> 

</form>

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
