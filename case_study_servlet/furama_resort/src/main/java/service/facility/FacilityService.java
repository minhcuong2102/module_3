package service.facility;

import repository.facility.FacilityRepository;
import repository.facility.IFacilityRepository;

public class FacilityService implements IFacilityService{
    private final IFacilityRepository facilityRepository = new FacilityRepository();


}
