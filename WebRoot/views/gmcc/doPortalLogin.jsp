<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="bingo.sso.server.plugin.gmcc.portal.DESHelper"%>
<%@page import="bingo.sso.server.protocol.openid.Constants"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>


<html>
	<head>
		<title>登录请求处理中</title>
	</head>
  	<body scroll="no" onload="portalLoginForm.submit();">
  		
  		<img src="${path}/login/loading.gif" border="0" height="25" width="25" align="absmiddle">登录请求处理中……
  		<%
  			DESHelper DES = new DESHelper("cr@bg.ic");
  			String username = request.getParameter("username");
  			String password = request.getParameter("password");
  			username = DES.decrypt(username);
  			password = DES.decrypt(password);
  			String callbackURL =  request.getParameter(Constants.OPENID_RETURN_TO);
  		%>
		<form name="portalLoginForm" action="<%=new String("http://portal.gmcc.net:7001/amserver/UI/Login") %>" method="post">
			<input type="hidden" name="goto" value="<%=callbackURL%>"/>
			<input type="hidden" name="Login.Token1" value="<%=username%>"/>
			<input type="hidden" name="Login.Token2" value="<%=password%>"/>
			<input type="hidden" name="module" value="LDAP"/>
		</form>
	</body>
</html>