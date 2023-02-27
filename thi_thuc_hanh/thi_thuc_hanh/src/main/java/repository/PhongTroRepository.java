package repository;

import config.BaseRepository;
import model.HinhThuc;
import model.PhongTro;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhongTroRepository implements IPhongTroRepository {
    private final String SELECT_ALL = "select p.*, ht.ten_hinh_thuc as ten_hinh_thuc from phong_tro p join hinh_thuc_thanh_toan ht on p.hinh_thuc = ht.ma_hinh_thuc";
    private final String SELECT_ALL_TYPE = "select * from hinh_thuc_thanh_toan";
    private final String INSERT = "call insert_pt(?, ?, ?, ?, ?, ?)";
    private final String ID = "select p.*, ht.ten_hinh_thuc as ten_hinh_thuc from phong_tro p join hinh_thuc_thanh_toan ht on p.hinh_thuc = ht.ma_hinh_thuc where p.id = ?";
    private final String SEARCH = "select p.*, ht.ten_hinh_thuc as ten_hinh_thuc from phong_tro p join hinh_thuc_thanh_toan ht on p.hinh_thuc = ht.ma_hinh_thuc where p.ma_phong_tro like ? and name like ? and so_dien_thoai like ?";
    private final String DELETE = "call delete_pt(?)";
    private final String UPDATE = "update phong_tro set ma_phong_tro = ?, name = ?, so_dien_thoai = ?, ngay_thue = ?, hinh_thuc = ?, ghi_chu = ? where id = ?";

    @Override
    public boolean insertCPT(PhongTro phongTro) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT);
            callableStatement.setString(1, phongTro.getMaPhongTro());
            callableStatement.setString(2, phongTro.getTenNguoiThueTro());
            callableStatement.setString(3, phongTro.getSoDienThoai());
            callableStatement.setString(4, phongTro.getNgayThue());
            callableStatement.setInt(5, phongTro.getHinhThuc().getId());
            callableStatement.setString(6, phongTro.getGhiChu());
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<PhongTro> selectAll() {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String maPhongTro = resultSet.getString("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("name");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String ngayThue = resultSet.getString("ngay_thue");
                int ma_hinh_thuc = resultSet.getInt("hinh_thuc");
                String ten_hinh_thuc = resultSet.getString("ten_hinh_thuc");
                HinhThuc hinhThuc = new HinhThuc(ma_hinh_thuc, ten_hinh_thuc);
                String ghiChu = resultSet.getString("ghi_chu");
                PhongTro phongTro = new PhongTro(id, maPhongTro, tenNguoiThueTro, soDienThoai, ngayThue, hinhThuc, ghiChu);
                phongTroList.add(phongTro);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return phongTroList;
    }

    @Override
    public List<HinhThuc> selectAllType() {
        List<HinhThuc> hinhThucList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_hinh_thuc");
                String name = resultSet.getNString("ten_hinh_thuc");
                HinhThuc customerType = new HinhThuc(id, name);
                hinhThucList.add(customerType);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return hinhThucList;
    }

    @Override
    public boolean deletePT(int id) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<PhongTro> search(String idSearch, String nameSearch, String phoneNumberSearch) {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + idSearch + "%");
            preparedStatement.setString(2, "%" + nameSearch + "%");
            preparedStatement.setString(3, "%" + phoneNumberSearch + "%");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String maPhongTro = resultSet.getString("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("name");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String ngayThue = resultSet.getString("ngay_thue");
                int ma_hinh_thuc = resultSet.getInt("hinh_thuc");
                String ten_hinh_thuc = resultSet.getString("ten_hinh_thuc");
                HinhThuc hinhThuc = new HinhThuc(ma_hinh_thuc, ten_hinh_thuc);
                String ghiChu = resultSet.getString("ghi_chu");
                PhongTro phongTro = new PhongTro(id, maPhongTro, tenNguoiThueTro, soDienThoai, ngayThue, hinhThuc, ghiChu);
                phongTroList.add(phongTro);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return phongTroList;
    }

    @Override
    public PhongTro selectId(int id) {
        PhongTro phongTro = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String maPhongTro = resultSet.getString("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("name");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String ngayThue = resultSet.getString("ngay_thue");
                int ma_hinh_thuc = resultSet.getInt("hinh_thuc");
                String ten_hinh_thuc = resultSet.getString("ten_hinh_thuc");
                HinhThuc hinhThuc = new HinhThuc(ma_hinh_thuc, ten_hinh_thuc);
                String ghiChu = resultSet.getString("ghi_chu");
                phongTro = new PhongTro(id, maPhongTro, tenNguoiThueTro, soDienThoai, ngayThue, hinhThuc, ghiChu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return phongTro;
    }

    @Override
    public boolean updatePT(PhongTro phongTro) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, phongTro.getMaPhongTro());
            preparedStatement.setString(2, phongTro.getTenNguoiThueTro());
            preparedStatement.setString(3, phongTro.getSoDienThoai());
            preparedStatement.setString(4, phongTro.getNgayThue());
            preparedStatement.setInt(5, phongTro.getHinhThuc().getId());
            preparedStatement.setString(6, phongTro.getGhiChu());
            preparedStatement.setInt(7, phongTro.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
