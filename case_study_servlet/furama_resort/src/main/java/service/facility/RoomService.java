package service.facility;

import model.facility.RentType;
import model.facility.Room;
import repository.facility.IRoomRepository;
import repository.facility.RoomRepository;

import java.util.List;

public class RoomService implements IRoomService{
    private final IRoomRepository roomRepository = new RoomRepository();

    @Override
    public List<Room> findAllRoom() {
        return roomRepository.findAllRoom();
    }

    @Override
    public boolean add(Room room) {
        return roomRepository.add(room);
    }

    @Override
    public boolean delete(int id) {
        return roomRepository.delete(id);
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType, String facilityFree) {
        return roomRepository.update(id, name, area, cost, maxPeople, rentType, facilityFree);
    }
}
