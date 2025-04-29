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
  DateTime? _selectedDate;
  List<String> _daftarTugas = [];

  void _tambahTugas() {
    final tugas = _tugasController.text;
    if (tugas.isNotEmpty) {
      setState(() {
        _daftarTugas.add(tugas);
        _tugasController.clear();
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
      });
    }
  }

  void _bukaDetail(String tugas) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPiketPage(tugas: tugas),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFFF3D00);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF3D00),
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
        child: Column(
          children: [
            Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nama Anggota',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama Anggota',
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
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
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
                        : DateFormat('dd-MM-yyyy')
                            .format(_selectedDate!),
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tugas Piket',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
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
                  child: const Text('Tambah', style: TextStyle(color: Colors.white),),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _daftarTugas[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
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
    );
  }
}
