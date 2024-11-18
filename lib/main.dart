import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/absen.dart';
import 'absensi.dart';
import 'riwayat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => datasiswa(),
      child: MaterialApp(
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Presensi(),
    const RiwayatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Pencatatan',
            icon: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            label: 'Riwayat',
            icon: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
