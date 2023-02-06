package model;

public class PhongTro {
    private int id;
    private String maPhongTro;
    private String tenNguoiThueTro;
    private String soDienThoai;
    private String ngayThue;
    private HinhThuc hinhThuc;
    private String ghiChu;

    public PhongTro() {
    }

    public PhongTro(String maPhongTro, String tenNguoiThueTro, String soDienThoai, String ngayThue, HinhThuc hinhThuc, String ghiChu) {
        this.maPhongTro = maPhongTro;
        this.tenNguoiThueTro = tenNguoiThueTro;
        this.soDienThoai = soDienThoai;
        this.ngayThue = ngayThue;
        this.hinhThuc = hinhThuc;
        this.ghiChu = ghiChu;
    }

    public PhongTro(int id, String maPhongTro, String tenNguoiThueTro, String soDienThoai, String ngayThue, HinhThuc hinhThuc, String ghiChu) {
        this.id = id;
        this.maPhongTro = maPhongTro;
        this.tenNguoiThueTro = tenNguoiThueTro;
        this.soDienThoai = soDienThoai;
        this.ngayThue = ngayThue;
        this.hinhThuc = hinhThuc;
        this.ghiChu = ghiChu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaPhongTro() {
        return maPhongTro;
    }

    public void setMaPhongTro(String maPhongTro) {
        this.maPhongTro = maPhongTro;
    }

    public String getTenNguoiThueTro() {
        return tenNguoiThueTro;
    }

    public void setTenNguoiThueTro(String tenNguoiThueTro) {
        this.tenNguoiThueTro = tenNguoiThueTro;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getNgayThue() {
        return ngayThue;
    }

    public void setNgayThue(String ngayThue) {
        this.ngayThue = ngayThue;
    }

    public HinhThuc getHinhThuc() {
        return hinhThuc;
    }

    public void setHinhThuc(HinhThuc hinhThuc) {
        this.hinhThuc = hinhThuc;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
}
