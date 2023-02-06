package service.facility;

import model.facility.RentType;
import model.facility.Villa;

import java.util.List;

public interface IVillaService {
    List<Villa> findAllVilla();
    boolean add(Villa villa);
    boolean delete(int id);
    boolean update(int id, String name, float area, double cost, int maxPeople,
                   RentType rentType, String standardRoom, String descriptionOtherConvenience,
                   double poolArea, int numberOfFloors);
}
