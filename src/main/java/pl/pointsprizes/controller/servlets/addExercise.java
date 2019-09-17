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

@WebServlet("/addExercise")
public class addExercise extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String exeDesc = request.getParameter("exeDesc");

        String exePoints = request.getParameter("exePoints");

        String exeGoal = request.getParameter("exeGoal");

        String newGoal = request.getParameter("newGoal");

        //tu problem 1
//        GoalsDAO.updateUser_Points_InDb(Integer.valueOf(exePoints),Integer.valueOf(exeGoal));   /**Dodaje punkty do celu na podstawie ID użytkownika */

        /** Zapisuje do bazy aktualizowane punkty użytkownika i ustawia jako nowy currentUser */
        User currentUser = User.getCurrentUser();
        currentUser.setUser_points(currentUser.getUser_points() + Integer.valueOf(exePoints));
        UserDao.updateInDb(currentUser);
        User.setCurrentUser(currentUser);
        /** */


        if(newGoal == null || newGoal.isEmpty()){

            GoalsDAO.updateUser_Points_InDb(Integer.valueOf(exePoints),Integer.valueOf(exeGoal)); ; /** Dodaje punkty do odpowiedniego celu, gdy cel już istnieje */

            Exercise exercise = ExerciseDAO.createExercise(exeDesc, exePoints, exeGoal);
            ExerciseDAO.save(exercise);
            HttpSession session = request.getSession();
            session.setAttribute("allExercises", ExerciseDAO.getCurrentUserExercises());
        }
        else {

            /** Zapisuje dane do tymczasowego obiektu Exercise, nie używam sesji */

            Exercise temp = new Exercise();

            temp.setDescription(exeDesc);
            temp.setExe_points(Integer.valueOf(exePoints));

            Exercise.setTemp(temp);


            response.sendRedirect("/views/addGoal.jsp?fromExercise=true");

//            request.setAttribute("exeDesc",exeDesc);
//            request.setAttribute("fromExercise",true);
//            request.getRequestDispatcher("/views/addGoal.jsp").forward(request,response);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
