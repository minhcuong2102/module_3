create database if not exists quan_ly_san_pham;
use quan_ly_san_pham;

create table phieu_xuat(
	so_px int auto_increment primary key,
    ngay_xuat date
);

create table vat_tu(
	ma_vtu int auto_increment primary key,
    ten_vtu varchar(50)
);

create table chi_tiet_phieu_xuat(
	so_px int,
    ma_vtu int,
    dg_xuat float,
    sl_xuat int,
    primary key (so_px, ma_vtu),
    foreign key (so_px) references phieu_xuat (so_px),
	foreign key (ma_vtu) references vat_tu (ma_vtu)
);

create table phieu_nhap(
	so_pn int auto_increment primary key,
    ngay_nhap date
);

create table chi_tiet_phieu_nhap(
	ma_vtu int,
    so_pn int,
	dg_nhap float,
    sl_nhap int,
    primary key (ma_vtu, so_pn),
	foreign key (so_pn) references phieu_nhap (so_pn),
	foreign key (ma_vtu) references vat_tu (ma_vtu)   
);

create table nha_cc(
	ma_ncc int auto_increment primary key,
    ten_ncc varchar(50),
    dia_chi varchar(50)
);

create table don_dh(
	so_dh int auto_increment primary key,
    ngay_dh date,
    ma_ncc int,
    foreign key (ma_ncc) references nha_cc (ma_ncc)
);

create table chi_tiet_don_dat_hang(
	so_dh int,
    ma_vtu int,
    primary key (so_dh, ma_vtu),
	foreign key (ma_vtu) references vat_tu (ma_vtu),
	foreign key (so_dh) references don_dh (so_dh)
);

create table so_dien_thoai(
	ma_sdt int auto_increment primary key,
    sdt varchar(10),
    ma_ncc int,
    foreign key (ma_ncc) references nha_cc (ma_ncc)
);
