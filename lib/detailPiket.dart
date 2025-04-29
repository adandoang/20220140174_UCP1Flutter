import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DetailPiketPage extends StatelessWidget {
  final String tugas;
  final String nama;
  final DateTime tanggal;

  const DetailPiketPage({
    super.key,
    required this.tugas,
    required this.nama,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFFF3D00);

    final tanggalFormatted = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(tanggal);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail $tugas'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tanggalFormatted,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    nama,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                tugas,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
