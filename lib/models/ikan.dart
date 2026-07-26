// lib/models/ikan.dart

import '../exceptions/data_tidak_valid_exception.dart';

// Parent class
abstract class Ikan {
  // Private field
  final String _id;
   String _nama;
  final String _jenis;  
  int _harga;
  int _stok;

  // Constructor
  Ikan(
    this._id,
    this._nama,
    this._jenis,
    this._harga,
    this._stok,
  );

  // Getter
  String get id => _id;
  String get nama => _nama;
  String get jenis => _jenis;
  int get harga => _harga;
  int get stok => _stok;

  // Setter + Validasi
  set nama(String value) {
    if (value.trim().isEmpty) {
      throw DataTidakValidException(
        "Nama ikan tidak boleh kosong.",
      );
    }
    _nama = value;
  }

  set harga(int value) {
    if (value < 0) {
      throw DataTidakValidException(
        "Harga tidak boleh negatif.",
      );
    }
    _harga = value;
  }

  set stok(int value) {
    if (value < 0) {
      throw DataTidakValidException(
        "Stok tidak boleh negatif.",
      );
    }
    _stok = value;
  }

  // Abstract method
  void tampilkanInfo();
}