<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- login2.jsp -->

			<form action="${pageContext.request.contextPath}/member/loginParameter.jsp" method="post">
				<table border="0" width="400" height="30">

					<td>아이디</td>
					<td><input type="text" name="ID" size="5"></td>

					<td>패스워드</td>
					<td><input type="password" name="PW" size="5"></td>

					<td><input type="submit" value="로그인"></td>
				</table> 
			</form>
