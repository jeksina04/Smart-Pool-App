import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final String name;

  const RegistrationPage(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
