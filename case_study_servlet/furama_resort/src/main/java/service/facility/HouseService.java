package service.facility;

import model.facility.House;
import model.facility.RentType;
import repository.facility.HouseRepository;
import repository.facility.IHouseRepository;

import java.util.List;

public class HouseService implements IHouseService{
    private final IHouseRepository houseRepository = new HouseRepository();

    @Override
    public List<House> findAllHouse() {
        return houseRepository.findAllHouse();
    }

    @Override
    public boolean add(House house) {
        return houseRepository.add(house);
    }

    @Override
    public boolean delete(int id) {
        return houseRepository.delete(id);
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType, String standardRoom, String descriptionOtherConvenience, int numberOfFloors) {
        return houseRepository.update(id, name, area, cost, maxPeople, rentType, standardRoom, descriptionOtherConvenience, numberOfFloors);
    }
}
