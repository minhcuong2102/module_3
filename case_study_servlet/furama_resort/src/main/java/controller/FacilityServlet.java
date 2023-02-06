package controller;

import model.customer.CustomerType;
import model.facility.House;
import model.facility.Room;
import model.facility.Villa;
import service.facility.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {
    private final IFacilityService facilityService = new FacilityService();
    private final IVillaService villaService = new VillaService();
    private final IHouseService houseService = new HouseService();
    private final IRoomService roomService = new RoomService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                addFacility(request, response);
                break;

            case "edit":
                editFacility(request, response);
                break;

            default:
                showListFacility(request, response);
                break;
        }
    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) {

    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {

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
                deleteFacility(request, response);
                break;

            case "search":
                searchFacility(request, response);
                break;

            default:
                showListFacility(request, response);
                break;
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {

    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        List<House> houseList = houseService.findAllHouse();
        List<Room> roomList = roomService.findAllRoom();
        List<Villa> villaList = villaService.findAllVilla();
        request.setAttribute("houseList", houseList);
        request.setAttribute("roomList", roomList);
        request.setAttribute("villaList", villaList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<House> houseList = houseService.findAllHouse();
        List<Room> roomList = roomService.findAllRoom();
        List<Villa> villaList = villaService.findAllVilla();
        request.setAttribute("houseList", houseList);
        request.setAttribute("roomList", roomList);
        request.setAttribute("villaList", villaList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
