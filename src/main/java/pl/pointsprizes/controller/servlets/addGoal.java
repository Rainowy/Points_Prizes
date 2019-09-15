package pl.pointsprizes.controller.servlets;

import pl.pointsprizes.model.DAO.GoalsDAO;
import pl.pointsprizes.model.Entity.Goals;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addGoal")
public class addGoal extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("field1");
        String description = request.getParameter("field5");

        /** Model = Tworzy nowy cel i dodaje do bazy **/
        Goals goal = GoalsDAO.createGoal(name, description);
        GoalsDAO.save(goal);
        HttpSession session = request.getSession();
        session.setAttribute("allGoals", GoalsDAO.getCurrentUserGoals());

       // response.sendRedirect("views/addGoal.jsp");

//        RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/addGoal.jsp");
//        PrintWriter out = response.getWriter();
//        out.println("<h2><font color=red>Cel został dodany</h2>");
//        rd.include(request, response);
//        <h2><font color=red>Nazwa użytkownika lub hasło niepoprawne</h2>


  RequestDispatcher rd = request.getRequestDispatcher("/views/addGoal.jsp");
        PrintWriter out = response.getWriter();
        out.println("<h2><font color=red>Cel został dodany</h2>");
        out.println("<font color=black>");
     rd.include(request, response);
//        <h2><font color=red>Nazwa użytkownika lub hasło niepoprawne</h2>

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
