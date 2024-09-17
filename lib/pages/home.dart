import 'package:flutter/material.dart';
import 'package:tugas1/pages/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String nim = '';
  String prodi = '';
  String angkatan = '';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilPage(
            name: name,
            nim: nim,
            prodi: prodi,
            angkatan: angkatan,
          ),
        ),
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Mahasiswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                onSaved: (value) {
                  name = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIM'),
                onSaved: (value) {
                  nim = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prodi'),
                onSaved: (value) {
                  prodi = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Prodi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Angkatan'),
                onSaved: (value) {
                  angkatan = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Angkatan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Menampilkan pesan "Data berhasil disimpan"
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data berhasil disimpan'),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Navigasi ke ProfilPage dan passing data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilPage(
                          name: name,
                          nim: nim,
                          prodi: prodi,
                          angkatan: angkatan,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
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
        onTap: _onItemTapped,
      ),
    );
  }
}
