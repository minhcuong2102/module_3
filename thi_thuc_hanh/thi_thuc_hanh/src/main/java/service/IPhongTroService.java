package service;

import model.HinhThuc;
import model.PhongTro;

import java.sql.SQLException;
import java.util.List;

public interface IPhongTroService {
    boolean insertCPT(PhongTro phongTro) throws SQLException;
    List<PhongTro> selectAll();
    List<HinhThuc> selectAllType();
    boolean deletePT(int id) throws SQLException;
    List<PhongTro> search(String idSearch, String nameSearch, String phoneNumberSearch);
    PhongTro selectId(int id);
    boolean updatePT(PhongTro phongTro) throws SQLException;
}
