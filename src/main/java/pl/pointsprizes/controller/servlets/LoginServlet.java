package pl.pointsprizes.controller.servlets;

import pl.pointsprizes.model.DAO.UserDao;
import pl.pointsprizes.model.Entity.User;

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


        response.setContentType("text/html;charset=UTF-8");

        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");

        User login = UserDao.getByPassword(pwd);    /** Model */

        if (user.equals(userID) && pwd.equals(password)) {
            setSessionAndCookie(request, response, user);
            //response.sendRedirect("/views/LoginSuccess.jsp"); /** standard według wzoru , bez plików w WEB-INF **/

        } else if (login != null && (login.getPassword().equals(pwd) && login.getName().equals(user))) {

           User.setCurrentUser(login);    /** Model = ustawiam currentUser w User */

            setSessionAndCookie(request, response, user);

            response.sendRedirect("/views/LoginSuccess.jsp"); /** standard według wzoru , bez plików w WEB-INF **/

//request.getRequestDispatcher("/WEB-INF/views/LoginSuccess.jsp").include(request,response); /** Przekierowuje do WEB-INF dispatcherem
            // response.sendRedirect("/LoginSuccess.jsp");
//            response.sendRedirect("/Dispatch?dispatch=LoginSuccess");  /**Dodatkowy servlet przekierowujący do jsp w WEB-INF w celach bezpieczeństwa */

        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out = response.getWriter();
            out.println("<h2><font color=red>Nazwa użytkownika lub hasło niepoprawne</h2>");
            rd.include(request, response);
        }

    }

    private void setSessionAndCookie(HttpServletRequest request, HttpServletResponse response, String user) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        //session expiry in 30 min
        session.setMaxInactiveInterval(10 * 60);
        Cookie userName = new Cookie("user", user);
        userName.setMaxAge(10 * 60);
        response.addCookie(userName);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("views/LoginSuccess.jsp");
    }
}
