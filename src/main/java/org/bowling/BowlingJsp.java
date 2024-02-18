package org.bowling;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BowlingJsp extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.print("it is hier");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("error.jsp");
                String currentScore = request.getParameter("currentscore");
                String scoreValue = currentScore.replaceAll("b", "");

                System.out.println("score now " + scoreValue);
                request.setAttribute("score", scoreValue);
                PrintWriter printWriter = response.getWriter();
                printWriter.println("Hello from GET method ");
               // requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
