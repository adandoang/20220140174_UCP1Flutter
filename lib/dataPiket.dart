import 'package:flutter/material.dart';

class DataPiketPage extends StatefulWidget {
  const DataPiketPage({Key? key}) : super(key: key);

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController _tugasController = TextEditingController();
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
}