// lib/models/ikan_hias.dart

import 'ikan.dart';

class IkanHias extends Ikan {
  String _warna;

  IkanHias(
    String id,
    String nama,
    String jenis,
    int harga,
    int stok,
    this._warna,
  ) : super(id, nama, jenis, harga, stok);

  String get warna => _warna;

  set warna(String value) {
    if (value.trim().isEmpty) {
      throw Exception("Warna ikan tidak boleh kosong.");
    }
    _warna = value;
  }

  @override
  void tampilkanInfo() {
    print("===== IKAN HIAS =====");
    print("ID     : $id");
    print("Nama   : $nama");
    print("Jenis  : $jenis");
    print("Harga  : Rp$harga");
    print("Stok   : $stok");
    print("Warna  : $warna");
  }
}