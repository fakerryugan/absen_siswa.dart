import 'package:flutter/material.dart';
import 'class.dart';
import 'package:intl/intl.dart';

class datasiswa with ChangeNotifier {
  List<Siswa> siswaList = [
    Siswa(name: 'Ali', isPresent: false),
    Siswa(name: 'Budi', isPresent: false),
    Siswa(name: 'Citra', isPresent: false),
  ];

  List<Riwayat> riwayatList = [];

  void simpanKehadiran() {
    int hadir = siswaList.where((siswa) => siswa.isPresent).length;
    int tidakHadir = siswaList.length - hadir;
    String tanggal = DateFormat('dd MMM yyyy').format(DateTime.now());
    riwayatList.insert(
        0, Riwayat(tanggal: tanggal, hadir: hadir, tidakHadir: tidakHadir));
    for (var siswa in siswaList) {
      siswa.isPresent = false;
    }

    notifyListeners();
  }
}
