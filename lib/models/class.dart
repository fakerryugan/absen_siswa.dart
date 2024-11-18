class Siswa {
  final String name;
  bool isPresent;

  Siswa({required this.name, this.isPresent = false});
}

class Riwayat {
  final String tanggal;
  final int hadir;
  final int tidakHadir;

  Riwayat(
      {required this.tanggal, required this.hadir, required this.tidakHadir});
}
