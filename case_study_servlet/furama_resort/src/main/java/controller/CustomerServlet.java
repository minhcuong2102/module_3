package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.CustomerService;
import service.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                addCustomer(request, response);
                break;

            case "edit":
                editCustomer(request, response);
                break;

            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerTypeId = Integer.parseInt(request.getParameter("customerType"));
        CustomerType customerType = new CustomerType(customerTypeId);
        String name = request.getParameter("name");
        String date = request.getParameter("dayOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerType, name, date, gender, idCard, phone, email, address);

        String mess = "Chỉnh sửa thông tin khách hàng thành công!";
        try {
            if (!customerService.updateCustomer(customer)){
                mess = "Chỉnh sửa thất bại!";
            }
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        request.setAttribute("mess", mess);
        showEditForm(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerTypeId = Integer.parseInt(request.getParameter("customerType"));
        CustomerType customerType = new CustomerType(customerTypeId);
        String name = request.getParameter("name");
        String date = request.getParameter("dayOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerType, name, date, gender, idCard, phone, email, address);

        String mess = "Thêm khách hàng thành công!";
        try {
            if (!customerService.insertCustomer(customer)){
                mess = "Không thể thêm khách hàng!";
            }
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;

            case "edit":
                showEditForm(request, response);
                break;

            case "delete":
                deleteCustomer(request, response);
                break;

            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = false;
        try {
            check = customerService.deleteCustomer(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String mess = "Xoá thành công";
        if (!check) {
            mess = "Xoá thất bại";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer existingCustomer = customerService.selectIdCustomer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("customer", existingCustomer);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypes = customerService.selectAllCustomerType();
        request.setAttribute("customerTypes", customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypes = customerService.selectAllCustomerType();
        System.out.println(customerList.size());
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypes", customerTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
