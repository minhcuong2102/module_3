package servlet;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static final List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1, "Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-1.jpg"));
        customerList.add(new Customer(1, "Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-1.jpg"));
        customerList.add(new Customer(1, "Nguyễn Thái Hoà", "1983-08-22", "Nam Định", "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-1.jpg"));
        customerList.add(new Customer(1, "Trần Đăng Khoa", "1983-08-23", "Hà Tây", "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-1.jpg"));
        customerList.add(new Customer(1, "Nguyễn Đình Thi", "1983-08-24", "Hà Nội", "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-1.jpg"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }
}
