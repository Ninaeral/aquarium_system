// lib/models/ikan_air_tawar.dart

import 'ikan.dart';

class IkanAirTawar extends Ikan {
  String asalSungai;

  IkanAirTawar(
    String id,
    String nama,
    String jenis,
    int harga,
    int stok,
    this.asalSungai,
  ) : super(id, nama, jenis, harga, stok);

  @override
  void tampilkanInfo() {
    print("===== IKAN AIR TAWAR =====");
    print("ID          : $id");
    print("Nama        : $nama");
    print("Jenis       : $jenis");
    print("Harga       : Rp$harga");
    print("Stok        : $stok");
    print("Asal Sungai : $asalSungai");
  }
}