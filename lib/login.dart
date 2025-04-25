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
              
              Text('Email'),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                          label: Icon(Icons.mail),
                          hintText: 'Input Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                }
              ),
              Text('Password'),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                          label: Icon(Icons.lock),
                          hintText: 'Input Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: Text('Masuk'),
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