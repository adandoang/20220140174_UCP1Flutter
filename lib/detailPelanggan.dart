import 'package:flutter/material.dart';
import 'package:ucp1_paml_managementapp/homepage.dart';
import 'package:ucp1_paml_managementapp/login.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    Key? key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFFF3D00);

    return Scaffold(
      backgroundColor: const Color(0xFFFDF4F2),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Detail $nama'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 10),
            Text(
              nama,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(email),
            Text(noHp),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 5),
            TextFormField(
              initialValue: alamat,
              readOnly: true,
             
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      TextFormField(
                        initialValue: provinsi,
                        readOnly: true,
                        
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      TextFormField(
                        initialValue: kodePos,
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}
