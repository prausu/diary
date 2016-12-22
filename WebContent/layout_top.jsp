<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session = "true" %>

<!-- layout_top.jsp -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<%
	String sessionID=(String)session.getAttribute("sessionId");
	boolean loginOK = sessionID == null ? false : true;

	if(loginOK){
%>	
	<td>
<a href="${pageContext.request.contextPath}/board/list.jsp">방명록</a> 
	</td>
	<td>
<a href="${pageContext.request.contextPath}/board2/list.jsp">게시판</a> 
	</td>
	<td>
<a href="${pageContext.request.contextPath}/member/viewMember.jsp">회원정보수정</a> 
	</td>	
	<td>
<a href="${pageContext.request.contextPath}/main.jsp">홈페이지</a> 
	</td>	
	<td width="400" align="right">
		<%=sessionID %>님으로 로그인 
		<input type="button" value="로그아웃" onClick="window.location='member/logoutParameter.jsp'"/>
	</td>
<%	
	}
	else
	{
%>	
	<td align="center">
<a href="${pageContext.request.contextPath}/member/signup.jsp">회원가입</a> 
	</td>
	<td>
<a href="${pageContext.request.contextPath}/main.jsp">홈페이지</a> 
	</td>	
	<td width="400" align="right">
		<jsp:include page="/member/login2.jsp" flush="false" />
	</td>
<%
	}
%>	
	
</table>