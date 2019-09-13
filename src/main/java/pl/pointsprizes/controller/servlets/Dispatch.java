package pl.pointsprizes.controller.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Dispatch")
public class Dispatch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String dispatch = request.getParameter("dispatch");
        if (dispatch.equals("CheckoutPage")) {
            request.getRequestDispatcher("/WEB-INF/views/CheckoutPage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dispatch = request.getParameter("dispatch");
        if (dispatch.equals("LoginSuccess")) {
            request.getRequestDispatcher("/WEB-INF/views/LoginSuccess.jsp").forward(request, response);

        }
    }
}


