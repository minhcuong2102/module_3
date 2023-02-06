package service.facility;

import model.facility.RentType;
import model.facility.Villa;
import repository.facility.IVillaRepository;
import repository.facility.VillaRepository;

import java.util.List;

public class VillaService implements IVillaService{
    private final IVillaRepository villaRepository = new VillaRepository();

    @Override
    public List<Villa> findAllVilla() {
        return villaRepository.findAllVilla();
    }

    @Override
    public boolean add(Villa villa) {
        return villaRepository.add(villa);
    }

    @Override
    public boolean delete(int id) {
        return villaRepository.delete(id);
    }

    @Override
    public boolean update(int id, String name, float area, double cost, int maxPeople, RentType rentType, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors) {
        return villaRepository.update(id, name, area, cost, maxPeople, rentType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors);
    }
}
