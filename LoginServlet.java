import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");

        // Set cookie for username (expires in 1 hour)
        Cookie userCookie = new Cookie("username", username);
        userCookie.setMaxAge(3600);
        response.addCookie(userCookie);

        // Set session attribute
        HttpSession session = request.getSession();
        session.setAttribute("user", username);

        // Redirect to welcome page
        response.sendRedirect("welcome.jsp");
    }
}
