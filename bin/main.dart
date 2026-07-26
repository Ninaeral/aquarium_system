import 'dart:io';

import 'package:aquarium_system/controllers/ikan_manager.dart';
import 'package:aquarium_system/exceptions/data_tidak_valid_exception.dart';
import 'package:aquarium_system/models/ikan_air_tawar.dart';
import 'package:aquarium_system/models/ikan_hias.dart';

void main() async {
  final manager = IkanManager();

  while (true) {
    print("\n===== MANAGEMENT AQUARIUM SYSTEM =====");
    print("1. Tambah Data");
    print("2. Lihat Semua");
    print("3. Cari");
    print("4. Hitung Total");
    print("5. Simpan Data");
    print("6. Keluar");

    stdout.write("Pilih menu : ");
    int? pilih = int.tryParse(stdin.readLineSync() ?? "");

    switch (pilih) {
      case 1:
        try {
          stdout.write("Pilih jenis ikan (1. Ikan Hias | 2. Ikan Air Tawar): ");
          int? jenis = int.tryParse(stdin.readLineSync() ?? "");

          stdout.write("ID : ");
          String id = stdin.readLineSync()!;

          stdout.write("Nama : ");
          String nama = stdin.readLineSync()!;

          stdout.write("Jenis : ");
          String jenisIkan = stdin.readLineSync()!;

          stdout.write("Harga : ");
          int harga = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
          
          stdout.write("Stok : ");
          int stok = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

          if (jenis == 1) {
            stdout.write("Warna : ");
            String warna = stdin.readLineSync()!;

            manager.tambah(
              IkanHias(
                id,
                nama,
                jenisIkan,
                harga,
                stok,
                warna,
              ),
            );
          } else if (jenis == 2) {
            stdout.write("Asal Sungai : ");
            String asalSungai = stdin.readLineSync()!;

            manager.tambah(
              IkanAirTawar(
                id,
                nama,
                jenisIkan,
                harga,
                stok,
                asalSungai,
              ),
            );
          } else {
            print("Pilihan tidak valid.");
          }
        } on DataTidakValidException catch (e) {
          print(e);
        } catch (e) {
          print("Terjadi kesalahan: $e");
        }
        break;

      case 2:
        manager.tampilkanSemua();
        break;

      case 3:
        stdout.write("Masukkan nama ikan: ");
        String keyword = stdin.readLineSync()!;
        manager.cari(keyword);
        break;

      case 4:
        print("Total harga ikan: Rp ${manager.hitungTotal()}");
        break;

      case 5:
        await manager.simpanData();
        break;

      case 6:
        print("Terima kasih.");
        return;

      default:
        print("Menu tidak tersedia.");
    }
  }
}