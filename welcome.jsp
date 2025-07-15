<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    String userFromSession = (session != null) ? (String) session.getAttribute("user") : null;

    String userFromCookie = "Not Found";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("username".equals(c.getName())) {
                userFromCookie = c.getValue();
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome Page</h2>
    <p>Username from session: <b><%= userFromSession != null ? userFromSession : "No session found" %></b></p>
    <p>Username from cookie: <b><%= userFromCookie %></b></p>
</body>
</html>
