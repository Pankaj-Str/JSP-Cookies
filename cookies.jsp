<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Cookies</title>
<!-- Use Bootstrap -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<!-- 1 create a form -->
		<form method="post" action="cookies.jsp" class="container">
		<div class="row justify-content-md-center">
		<h1 class="text-center h1">
		<p>Enter cookie name and cookie value.</p>
		</h1>
		<div class="col-md-auto col-4 mt-2">
		<div class="input-group mb-3">
		 <div class="input-group-text">
		<lable>Cookie Name</lable>
		 </div>
		 <input type="text" class="form-control" name="name">
		</div>
		 <div class="input-group mb-3">
		 <div class="input-group-text">
		<lable>Cookie Value</lable>
		 </div>
		 <input type="text" class="form-control" name="value">
		</div>
		<button type="submit" class="btn btn-warning">Add Cookie</button>
		</div>
		</div>
		</form>
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
</table>

 <!-- 2. add cookies  -->
	<%
	// Checks for the value of name that it is null or not
		String name = request.getParameter("name");
	if (name != null && name.length() > 0) {
		String value = request.getParameter("value");
		Cookie retrieveCookies = new Cookie(name, value);
	// add cookies to response object of jsp 
		response.addCookie(retrieveCookies);
	// redirects control to same page for new request
		response.sendRedirect("cookies.jsp");
	}
	%>
	
  <!-- 3. show cookies into table -->	
  
<h1 class="text-center h1">
Cookies used so far ...
</h1>
<table class="table table-bordered border-primary container">
<thead>
<tr class="table-success">
<td>Cookie Name</td>
<td>Cookie Value</td>
</tr>
</thead>
		<%
		// getCookies() method returns array of Cookie 
		// we iterate over it and extract the name and value
		// into seperate variables cookieName and cookieValue
			Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			
			// display each value on jsp by iterating one by one 
		%>
		<tr>
		<td><%=cookieName%></td>
		<td><%=cookieValue %></td>
		</tr>
		<%
		}
		%>
</table>
</body>
</html>
