import 'package:flutter/material.dart';

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
}
