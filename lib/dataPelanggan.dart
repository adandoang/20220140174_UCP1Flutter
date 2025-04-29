import 'package:flutter/material.dart';
import 'package:ucp1_paml_managementapp/detailPelanggan.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kodePosController = TextEditingController();

  final Color primaryColor = const Color(0xFFFF3D00);

  void _simpanData() {
  if (_formKey.currentState!.validate()) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPelangganPage(
          nama: _namaController.text,
          email: _emailController.text,
          noHp: _noHpController.text,
          alamat: _alamatController.text,
          provinsi: _provinsiController.text,
          kodePos: _kodePosController.text,
        ),
      ),
    );
  }
}


  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _emailController.clear();
    _noHpController.clear();
    _alamatController.clear();
    _provinsiController.clear();
    _kodePosController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4F2),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text('Data Pelanggan'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Nama Cust', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 5),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  hintText: 'Nama Cust',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Nama Cust wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              Row(children: [
              Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(width: 202),
              Text('No HP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ]),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Email wajib diisi' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _noHpController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'No Hp',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'No Hp wajib diisi' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 5),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  hintText: 'Alamat',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Alamat wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              Row(children: [
              Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(width: 185),
              Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ]),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _provinsiController,
                      decoration: InputDecoration(
                        hintText: 'Provinsi',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Provinsi wajib diisi' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _kodePosController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Kode Pos',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Kode Pos wajib diisi' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Simpan', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _resetForm,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Reset', style: TextStyle(fontSize: 16, color: primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
