package repository.facility;

import model.facility.House;
import model.facility.RentType;
import model.facility.Room;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomRepository implements IRoomRepository {
    private final IFacilityRepository facilityRepository = new FacilityRepository();
    private final String SELECT_ROOM = "select f.*, ft.name as facility_type_name, rt.name as rental_type_name from facility f join facility_type ft on f.facility_type_id = ft.id join rent_type rt on f.rent_type_id = rt.id where ft.name = 'Room'";
    private final String INSERT_ROOM = "insert into facility(name, area,cost, max_people, facility_free, rent_type_id, facility_type_id) values(?, ?, ?, ?, ?, ?, ?)";
    private final String UPDATE_ROOM = "update facility set name = ?, area = ?, cost = ?, max_people = ?, facility_free = ?, rent_type_id = ? where id = ?";

    @Override
    public List<Room> findAllRoom() {
        List<Room> roomList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROOM);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                float area = resultSet.getFloat("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeId = resultSet.getInt("rent_type_id");
                String rentTypeName = resultSet.getString("rental_type_name");
                RentType rentType = new RentType(rentTypeId, rentTypeName);
                String facilityFree = resultSet.getString("facility_free");

                Room room = new Room(id, name, area, cost, maxPeople, rentType, facilityFree);
                roomList.add(room);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return roomList;
    }

    @Override
    public boolean add(Room room) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ROOM);
            preparedStatement.setString(1, room.getName());
            preparedStatement.setInt(2, (int) room.getArea());
            preparedStatement.setDouble(3, room.getCost());
            preparedStatement.setInt(4, room.getMaxPeople());
            preparedStatement.setString(5, room.getFacilityFree());
            preparedStatement.setInt(6, room.getRentType().getId());
            preparedStatement.setInt(7, 3);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType, String facilityFree) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ROOM);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, (int) area);
            preparedStatement.setDouble(3, cost);
            preparedStatement.setInt(4, maxPeople);
            preparedStatement.setString(5, facilityFree);
            preparedStatement.setInt(6, rentType.getId());
            preparedStatement.setInt(7, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
