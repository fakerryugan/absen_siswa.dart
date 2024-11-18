import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/absen.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var riwayatList = Provider.of<datasiswa>(context).riwayatList;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Riwayat Kehadiran', style: TextStyle(fontSize: 18)),
          Expanded(
            child: ListView.builder(
              itemCount: riwayatList.length,
              itemBuilder: (context, index) {
                var riwayat = riwayatList[index];
                return ListTile(
                  title: Text(riwayat.tanggal),
                  subtitle: Text(
                      'Hadir: ${riwayat.hadir}, Tidak Hadir: ${riwayat.tidakHadir}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
