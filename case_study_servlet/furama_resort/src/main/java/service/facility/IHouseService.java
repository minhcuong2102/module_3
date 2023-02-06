package service.facility;

import model.facility.House;
import model.facility.RentType;

import java.util.List;

public interface IHouseService {
    List<House> findAllHouse();
    boolean add(House house);
    boolean delete(int id);
    boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType,
                   String standardRoom, String descriptionOtherConvenience, int numberOfFloors);
}
