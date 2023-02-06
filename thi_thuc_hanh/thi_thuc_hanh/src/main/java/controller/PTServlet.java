package controller;

import model.HinhThuc;
import model.PhongTro;
import service.IPhongTroService;
import service.PhongTroService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PTServlet", urlPatterns = "/phongtro")
public class PTServlet extends HttpServlet {
    private final IPhongTroService phongTroService = new PhongTroService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                addPT(request, response);
                break;

            case "edit":
                editPT(request, response);
                break;

            default:
                showList(request, response);
                break;
        }
    }

    private void editPT(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int ma_hinh_thuc = Integer.parseInt(request.getParameter("hinhThucList"));
        HinhThuc hinhThuc = new HinhThuc(ma_hinh_thuc);
        String maPhongTro = request.getParameter("maPhongTro");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String phone = request.getParameter("phone");
        String ghiChu = request.getParameter("ghiChu");

        PhongTro phongTro = new PhongTro(id, maPhongTro, name, phone, date, hinhThuc, ghiChu);

        String mess = "Thêm thành công!";
        try {
            if (!phongTroService.updatePT(phongTro)) {
                mess = "Không thể thêm phòng trọ!";
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("mess", mess);
        showEditForm(request, response);
    }

    private void addPT(HttpServletRequest request, HttpServletResponse response) {
        int ma_hinh_thuc = Integer.parseInt(request.getParameter("hinhThucList"));
        HinhThuc hinhThuc = new HinhThuc(ma_hinh_thuc);
        String maPhongTro = request.getParameter("maPhongTro");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String phone = request.getParameter("phone");
        String ghiChu = request.getParameter("ghiChu");

        PhongTro phongTro = new PhongTro(maPhongTro, name, phone, date, hinhThuc, ghiChu);

        String mess = "Thêm thành công!";
        try {
            if (!phongTroService.insertCPT(phongTro)) {
                mess = "Không thể thêm phòng trọ!";
            }
        } catch (SQLException throwables) {
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
                deletePT(request, response);
                break;

            case "search":
                searchPT(request, response);
                break;

            default:
                showList(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        PhongTro phongTro = phongTroService.selectId(id);
        List<HinhThuc> hinhThucList = phongTroService.selectAllType();
        request.setAttribute("hinhThucList", hinhThucList);
        request.setAttribute("phongTro", phongTro);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<HinhThuc> hinhThucList = phongTroService.selectAllType();
        request.setAttribute("hinhThucList", hinhThucList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deletePT(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = false;
        try {
            check = phongTroService.deletePT(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String mess = "Xoá thành công";
        if (!check) {
            mess = "Xoá thất bại";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void searchPT(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("nameSearch");
        String idSearch = request.getParameter("idSearch");
        String phoneNumberSearch = request.getParameter("phoneNumberSearch");

        List<PhongTro> phongTroList = phongTroService.search(idSearch, nameSearch, phoneNumberSearch);
        request.setAttribute("phongTroList", phongTroList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<PhongTro> phongTroList = phongTroService.selectAll();
        List<HinhThuc> hinhThucList = phongTroService.selectAllType();
        System.out.println(phongTroList.size());
        request.setAttribute("phongTroList", phongTroList);
        request.setAttribute("hinhThucList", hinhThucList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
