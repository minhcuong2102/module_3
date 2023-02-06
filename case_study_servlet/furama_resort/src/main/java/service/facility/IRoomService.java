package service.facility;

import model.facility.RentType;
import model.facility.Room;

import java.util.List;

public interface IRoomService {
    List<Room> findAllRoom();
    boolean add(Room room);
    boolean delete(int id);
    boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType, String facilityFree);
}
