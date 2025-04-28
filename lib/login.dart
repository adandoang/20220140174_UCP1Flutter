import 'package:flutter/material.dart';
import 'package:ucp1_paml_managementapp/homepage.dart';
import 'package:ucp1_paml_managementapp/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                    'assets/images/nike.png',
                    height: 100),
                    const SizedBox(height: 20),
                  const Text(
                    'SELAMAT DATANG KEMBALI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
              Text('Email'),
              TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan email anda';
                      }
                      return null;
                    },
                  ),
              Text('Password'),
              TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan password anda';
                      }
                      return null;
                    },
                  ),
              const SizedBox(height: 70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(6000, 70),
                  backgroundColor: const Color.fromARGB(255, 255, 47, 0),
                  foregroundColor: Colors.white70
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: Text('Masuk', style: TextStyle(fontSize: 15),),
              ),
              TextButton(onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> Registerpage()),
                );
              },
              child: Text('Belum punya akun? Daftar'),)
            ],
          ),
          )),
    ); 
  }
}