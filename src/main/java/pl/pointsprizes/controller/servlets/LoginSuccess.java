package pl.pointsprizes.controller.servlets;

import pl.pointsprizes.model.DAO.ExerciseDAO;
import pl.pointsprizes.model.DAO.GoalsDAO;
import pl.pointsprizes.model.DAO.UserDao;
import pl.pointsprizes.model.Entity.Exercise;
import pl.pointsprizes.model.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginSuccess")
public class LoginSuccess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        if (session.getAttribute("allGoals") == null) {
            session.setAttribute("allGoals", GoalsDAO.getCurrentUserGoals());
        }
        if (session.getAttribute("allExercises") == null) {
            session.setAttribute("allExercises", ExerciseDAO.getCurrentUserExercises());
        }

        request.setAttribute("userPoints",String.valueOf(pointsAlignment()));
        //request.setAttribute("userExercises", session.getAttribute("allExercises"));
        request.getRequestDispatcher("/views/LoginSuccess.jsp").forward(request,response);
    }


    private static int pointsAlignment() {
        /** Pobiera wszystkie puntky użytkownika z tabeli Goals, sumuje je i sprawdza czy się zgadzają z punktami z tabeli User, jeśli nie to je wyrównuje */

        int allUserPointsFromGoals = GoalsDAO.getAllUserPoints(User.getCurrentUser());
        if (User.getCurrentUser().getUser_points() != allUserPointsFromGoals) {
            User currentUser = User.getCurrentUser();
            currentUser.setUser_points(allUserPointsFromGoals);
            UserDao.updateInDb(currentUser);
        }
        return allUserPointsFromGoals;
    }
}
