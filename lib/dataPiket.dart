import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1_paml_managementapp/detailPiket.dart';


class DataPiketPage extends StatefulWidget {
  const DataPiketPage({Key? key}) : super(key: key);

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController _tugasController = TextEditingController();
  TextEditingController namaController = TextEditingController(text: 'Admin');

  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  List<Map<String, dynamic>> _daftarTugas = [];

  String? _tanggalError;

  void _tambahTugas() {
  setState(() {
    _tanggalError = _selectedDate == null ? 'Tanggal tidak boleh kosong' : null;
  });

  if (_formKey.currentState!.validate() && _selectedDate != null) {
    final tugas = _tugasController.text;
    final nama = namaController.text;
    final tanggal = _selectedDate!;

    setState(() {
      _daftarTugas.add({
        'nama': nama,
        'tanggal': tanggal,
        'tugas': tugas,
      });
      _tugasController.clear();
      _selectedDate = null;
    });
  }
}


  void _pilihTanggal() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _tanggalError = null;
      });
    }
  }

  void _bukaDetail(Map<String, dynamic> tugasData) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailPiketPage(
        tugas: tugasData['tugas'],
        nama: tugasData['nama'],
        tanggal: tugasData['tanggal'],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFFF3D00);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Piket Gudang',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nama Anggota',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pilih Tanggal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: _pilihTanggal,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: _selectedDate == null
                          ? 'Pilih Tanggal'
                          : DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(_selectedDate!),
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorText: _tanggalError,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tugas Piket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        hintText: 'Tugas Piket',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Tugas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _tambahTugas,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 22),
                    ),
                    child: const Text(
                      'Tambah',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _daftarTugas.isEmpty
                    ? const Center(
                        child: Text(
                          'Belum ada data',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _daftarTugas.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _bukaDetail(_daftarTugas[index]),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      _daftarTugas[index]['tugas'], 
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.white),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
