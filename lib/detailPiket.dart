import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String tugas;

  const DetailPiketPage({super.key, required this.tugas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Color(0xFFFF3D00),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Detail untuk tugas: $tugas',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
