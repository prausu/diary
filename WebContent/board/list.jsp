<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="mvjsp.chap13.model.Message"%>
<%@ page import="mvjsp.chap13.model.MessageListView"%>
<%@ page import="mvjsp.chap13.service.GetMessageListService"%>
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
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetMessageListService messageListService = 
			GetMessageListService.getInstance();
	MessageListView viewData = 
			messageListService.getMessageList(pageNumber);
%>		
		
		

<%  if (viewData.isEmpty()) { %>
��ϵ� �޽����� �����ϴ�.
<%  } else { /* �޽��� �ִ� ��� ó�� ���� */ %>
<table border="1">
<%
		for (Message message : viewData.getMessageList()) {
%>
	<tr>
		<td>
		�޽��� ��ȣ: <%= message.getId() %> <br/>
		�մ� �̸�: <%= message.getGuestName() %> <br/>
		�޽���: <%= message.getMessage() %> <br/>
		<a href="confirmDeletion.jsp?messageId=<%= message.getId() %>">
		[�����ϱ�]</a>
		</td>
	</tr>
<%  	} %>
</table>

<%  	for (int i = 1 ; i <= viewData.getPageTotalCount() ; i++) { %>
<a href="list.jsp?page=<%= i %>">[<%= i %>]</a> 
<%  	} %>

<%  } /* �޽��� �ִ� ��� ó�� �� */ %>		
		
		


<form action="writeMessage.jsp" method="post">
�̸�: <input type="text" name="guestName" /> <br />
��ȣ: <input type="password" name="password" /> <br />
�޽���: <textarea name="message" cols="30" row="3"></textarea> <br />
<input type="submit" value="�޽��� �����" />
</form>
<hr>		
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
