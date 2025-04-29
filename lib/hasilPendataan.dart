import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'homepage.dart';
import 'login.dart';

class ResultPage extends StatelessWidget {
  final DateTime tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  final int totalHarga;

  const ResultPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(20),
              child: const Icon(
                Icons.check,
                color: Colors.green,
                size: 60,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),
            _buildDetailItem('Tanggal',
                DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(tanggal)),
            _buildDetailItem('Jenis Transaksi', jenisTransaksi),
            _buildDetailItem('Jenis Barang', jenisBarang),
            _buildDetailItem('Jumlah Barang', jumlahBarang.toString()),
            _buildDetailItem('Jenis Harga Satuan',
                'Rp. ${NumberFormat.decimalPattern('id_ID').format(hargaSatuan)}'),
            _buildDetailItem('Total Harga',
                'Rp. ${NumberFormat.decimalPattern('id_ID').format(totalHarga)}'),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 14)),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
      ],
    );
  }
}
