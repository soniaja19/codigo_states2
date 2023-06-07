import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Registro"),
      ),
      body: Column(
        children: [
          const TextField(),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
