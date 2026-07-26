// lib/controllers/ikan_manager.dart

import '../models/ikan.dart';

class IkanManager {
  // Collection
  final List<Ikan> _daftarIkan = [];

  // Tambah data
  void tambah(Ikan ikan) {
    _daftarIkan.add(ikan);
    print("Data ikan berhasil ditambahkan.");
  }

  // Lihat semua data
  void tampilkanSemua() {
    if (_daftarIkan.isEmpty) {
      print("Belum ada data ikan.");
      return;
    }

    for (var ikan in _daftarIkan) {
      ikan.tampilkanInfo();
      print("---------------------");
    }
  }

  // Cari data berdasarkan nama
  void cari(String keyword) {
    final hasil = _daftarIkan.where(
      (ikan) => ikan.nama.toLowerCase().contains(keyword.toLowerCase()),
    ).toList();

    if (hasil.isEmpty) {
      print("Ikan tidak ditemukan.");
      return;
    }

    for (var ikan in hasil) {
      ikan.tampilkanInfo();
      print("---------------------");
    }
  }

  // Hitung total harga
  int hitungTotal() {
    return _daftarIkan.fold(
      0,
      (total, ikan) => total + ikan.harga,
    );
  }

  // Simpan data (simulasi)
  Future<void> simpanData() async {
    print("Menyimpan data...");
    await Future.delayed(Duration(seconds: 2));
    print("Data berhasil disimpan.");
  }
}