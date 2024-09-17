import 'package:flutter/material.dart';
import 'package:tugas1/pages/home.dart';
// ProfilPage tidak perlu diimpor langsung di sini, karena kita akan mengirim data ke sana nanti

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        // Hapus '/profil' di sini karena kita akan menggunakan MaterialPageRoute untuk mengirim data
      },
    );
  }
}

void main() {
  runApp(const MainApp());
}
