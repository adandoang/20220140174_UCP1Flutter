import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PendataanBarangPage extends StatefulWidget {
  const PendataanBarangPage({super.key});

  @override
  _PendataanBarangPageState createState() => _PendataanBarangPageState();
}

class _PendataanBarangPageState extends State<PendataanBarangPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _selectedTransaksi;
  String? _selectedBarang;
  int _jumlahBarang = 0;
  int _hargaSatuan = 0;

  final TextEditingController _dateController = TextEditingController();

  final List<String> _transaksiOptions = ['Barang Masuk', 'Barang Keluar'];
  final Map<String, int> _barangOptions = {
    'Sepatu': 1200000,
    'Tas': 600000,
    'Baju': 250000,
    'Kaos Kaki': 80000,
  };

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(pickedDate);
      });
    }
  }

  void _updateHargaSatuan(String? barang) {
    setState(() {
      _selectedBarang = barang;
      _hargaSatuan = barang != null ? _barangOptions[barang]! : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFFF3D00);

    OutlineInputBorder roundedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
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
          'Pendataan Barang',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Transaksi',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: roundedBorder,
                  enabledBorder: roundedBorder,
                  focusedBorder: roundedBorder,
                ),
                readOnly: true,
                onTap: () => _pickDate(context),
                validator: (value) =>
                    _selectedDate == null ? 'Pilih tanggal transaksi' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jenis Transaksi',
                  border: roundedBorder,
                  enabledBorder: roundedBorder,
                  focusedBorder: roundedBorder,
                ),
                value: _selectedTransaksi,
                items: _transaksiOptions
                    .map((transaksi) => DropdownMenuItem(
                          value: transaksi,
                          child: Text(transaksi),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTransaksi = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Pilih jenis transaksi' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jenis Barang',
                  border: roundedBorder,
                  enabledBorder: roundedBorder,
                  focusedBorder: roundedBorder,
                ),
                value: _selectedBarang,
                items: _barangOptions.keys
                    .map((barang) => DropdownMenuItem(
                          value: barang,
                          child: Text(barang),
                        ))
                    .toList(),
                onChanged: (value) => _updateHargaSatuan(value),
                validator: (value) =>
                    value == null ? 'Pilih jenis barang' : null,
              ),
              const SizedBox(height: 16),
              Row(children: [
                Text('Jumlah Barang',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(width: 160,),
                Text('Harga Satuan',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ]),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: roundedBorder,
                        enabledBorder: roundedBorder,
                        focusedBorder: roundedBorder,
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _jumlahBarang = int.parse(value!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukkan jumlah barang';
                        }
                        int? jumlah = int.tryParse(value);
                        if (jumlah == null || jumlah < 1) {
                          return 'Jumlah harus lebih dari 0';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: roundedBorder,
                        enabledBorder: roundedBorder,
                        focusedBorder: roundedBorder,
                        prefixText: 'Rp. ',
                      ),
                      controller: TextEditingController(
                        text: _hargaSatuan.toString(),
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 211, vertical: 25),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
