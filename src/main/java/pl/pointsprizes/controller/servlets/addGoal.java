package pl.pointsprizes.controller.servlets;

import pl.pointsprizes.model.DAO.ExerciseDAO;
import pl.pointsprizes.model.DAO.GoalsDAO;
import pl.pointsprizes.model.Entity.Exercise;
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

        String hidden = request.getParameter("fromExercise");

        System.out.println("HIDDEN TO" + hidden);
        HttpSession session = request.getSession();

        /** Model = Tworzy nowy cel i dodaje do bazy **/
        Goals goal = GoalsDAO.createGoal(name, description);
        GoalsDAO.save(goal);
        session.setAttribute("allGoals", GoalsDAO.getCurrentUserGoals());


        if (hidden == null || hidden.isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("/views/addGoal.jsp");
            PrintWriter out = response.getWriter();
            out.println("<h2><font color=red>Cel został dodany</h2>");
            out.println("<font color=black>");
            rd.include(request, response);

        } else {
            GoalsDAO.updateUser_Points_InDb(Integer.valueOf(Exercise.getTemp().getExe_points()),Integer.valueOf(GoalsDAO.getNewGoalId())); /** Dodaje punkty do odpowiedniego celu gdy wraz z zadaniem tworzymy nowy cel */
            String desc = Exercise.getTemp().getDescription();
            String points = String.valueOf(Exercise.getTemp().getExe_points());
            String goalId = String.valueOf(GoalsDAO.getNewGoalId());
            Exercise exercise = ExerciseDAO.createExercise(desc, points, goalId);
            ExerciseDAO.save(exercise);


            session.setAttribute("allExercises", ExerciseDAO.getCurrentUserExercises());

            RequestDispatcher rd = request.getRequestDispatcher("/views/addExercise.jsp");
            PrintWriter out = response.getWriter();
            out.println("<h2><font color=red>Cel został dodany</h2>");
            out.println("<font color=black>");
            rd.include(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
