package pl.pointsprizes.controller.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private final String userID = "admin";
    private final String password = "sabaka";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        //response.setContentType("text/html;charset=UTF-8");

        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");

        if (userID.equals(user) && password.equals(pwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", "Tomek");
            //session expiry in 30 min
            session.setMaxInactiveInterval(10);
            Cookie userName = new Cookie("user", user);
            userName.setMaxAge(5 * 60);
            response.addCookie(userName);
            //request.getRequestDispatcher("/WEB-INF/views/LoginSuccess.jsp").include(request,response);

            response.sendRedirect("/views/LoginSuccess.jsp"); /** standard według wzoru , bez plików w WEB-INF **/

           // response.sendRedirect("/LoginSuccess.jsp");

           // response.sendRedirect("/Dispatch?dispatch=LoginSuccess");  /**Dodatkowy servlet przekierowyjący do jsp w WEB-INF w celach bezpieczeństwa */
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Nazwa użytkownika lub hasło niepoprawne");
            rd.include(request, response);
        }

    }


}
