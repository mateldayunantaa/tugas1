import 'package:flutter/material.dart';
import 'package:tugas1/pages/home.dart';

class ProfilPage extends StatelessWidget {
  final String name;
  final String nim;
  final String prodi;
  final String angkatan;
  final int _selectedIndex = 1;

  const ProfilPage({
    required this.name,
    required this.nim,
    required this.prodi,
    required this.angkatan,
    Key? key,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Mahasiswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('NIM: $nim', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Prodi: $prodi', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Angkatan: $angkatan', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
