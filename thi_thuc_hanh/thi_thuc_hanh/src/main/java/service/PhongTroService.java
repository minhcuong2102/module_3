package service;

import model.HinhThuc;
import model.PhongTro;
import repository.IPhongTroRepository;
import repository.PhongTroRepository;

import java.sql.SQLException;
import java.util.List;

public class PhongTroService implements IPhongTroService{
    private final IPhongTroRepository phongTroRepository = new PhongTroRepository();

    @Override
    public boolean insertCPT(PhongTro phongTro) throws SQLException {
        return phongTroRepository.insertCPT(phongTro);
    }

    @Override
    public List<PhongTro> selectAll() {
        return phongTroRepository.selectAll();
    }

    @Override
    public List<HinhThuc> selectAllType() {
        return phongTroRepository.selectAllType();
    }

    @Override
    public boolean deletePT(int id) throws SQLException {
        return phongTroRepository.deletePT(id);
    }

    @Override
    public List<PhongTro> search(String idSearch, String nameSearch, String phoneNumberSearch) {
        return phongTroRepository.search(idSearch, nameSearch, phoneNumberSearch);
    }

    @Override
    public PhongTro selectId(int id) {
        return phongTroRepository.selectId(id);
    }

    @Override
    public boolean updatePT(PhongTro phongTro) throws SQLException {
        return phongTroRepository.updatePT(phongTro);
    }
}
