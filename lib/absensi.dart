import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'models/absen.dart';

class Presensi extends StatelessWidget {
  const Presensi({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<datasiswa>(context);
    var siswaList = provider.siswaList;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Presensi Siswa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: siswaList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CheckboxListTile(
                      title: Text(siswaList[index].name),
                      value: siswaList[index].isPresent,
                      onChanged: (value) {
                        siswaList[index].isPresent = value!;
                        provider.notifyListeners();
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDate,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed:
                    siswaList.isEmpty ? null : () => provider.simpanKehadiran(),
                child: const Text('Simpan Kehadiran'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
