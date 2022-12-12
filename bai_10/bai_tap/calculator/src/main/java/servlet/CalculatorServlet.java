package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double first = Double.parseDouble(request.getParameter("first"));
        double second = Double.parseDouble(request.getParameter("second"));
        String operator = request.getParameter("operator");
        double result = 0;
        try {
            switch (operator) {
                case "+":
                    result = first + second;
                    request.setAttribute("addition", "selected");
                    break;
                case "-":
                    result = first - second;
                    request.setAttribute("subtraction", "selected");
                    break;
                case "*":
                    result = first * second;
                    request.setAttribute("multiplication", "selected");
                    break;
                case "/":
                    if (second != 0) {
                        result = first / second;
                        request.setAttribute("division", "selected");
                    } else {
                        throw new RuntimeException("Error in division by 0");
                    }
                    break;
            }
            request.setAttribute("result", result);
            request.setAttribute("first", first);
            request.setAttribute("second", second);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("calculator.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("result", "Error: " + e.getMessage());
            request.getRequestDispatcher("calculator.jsp").forward(request, response);
        }

    }
}
