package repository.facility;

import model.facility.RentType;
import model.facility.Villa;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VillaRepository implements IVillaRepository {
    private final IFacilityRepository facilityRepository = new FacilityRepository();
    private final String SELECT_VILLA = "select f.*, ft.name as facility_type_name, rt.name as rental_type_name from facility f join facility_type ft on f.facility_type_id = ft.id join rent_type rt on f.rent_type_id = rt.id where ft.name = 'Villa'";
    private final String INSERT_VILLA = "insert into facility(name, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, rent_type_id, facility_type_id) values(?,?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_VILLA = "update facility set name = ?, area = ?, cost = ?, max_people = ?, standard_room = ?, description_other_convenience = ?, pool_area = ?, number_of_floors = ?, rent_type_id = ? where facility_type_id = ?";

    @Override
    public List<Villa> findAllVilla() {
        List<Villa> villaList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VILLA);
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
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberFloor = resultSet.getInt("number_of_floors");

                Villa villa = new Villa(id, name, area, cost, maxPeople, rentType, standardRoom, descriptionOtherConvenience, poolArea, numberFloor);
                villaList.add(villa);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return villaList;
    }

    @Override
    public boolean add(Villa villa) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VILLA);
            preparedStatement.setString(1, villa.getName());
            preparedStatement.setInt(2, (int) villa.getArea());
            preparedStatement.setDouble(3, villa.getCost());
            preparedStatement.setInt(4, villa.getMaxPeople());
            preparedStatement.setString(5, villa.getStandardRoom());
            preparedStatement.setString(6, villa.getDescriptionOtherConvenience());
            preparedStatement.setFloat(7, (float) villa.getPoolArea());
            preparedStatement.setInt(8, villa.getNumberOfFloors());
            preparedStatement.setInt(9, villa.getRentType().getId());
            preparedStatement.setInt(10, 1);
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
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VILLA);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, (int) area);
            preparedStatement.setDouble(3, cost);
            preparedStatement.setInt(4, maxPeople);
            preparedStatement.setString(5, standardRoom);
            preparedStatement.setString(6, descriptionOtherConvenience);
            preparedStatement.setFloat(7, (float) poolArea);
            preparedStatement.setInt(8, numberOfFloors);
            preparedStatement.setInt(9, rentType.getId());
            preparedStatement.setInt(10, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
