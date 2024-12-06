import 'package:flutter/material.dart';

class HolaMundo extends StatefulWidget {
  const HolaMundo({super.key});

  @override
  State<HolaMundo> createState() => _HolaMundoState();
}

class _HolaMundoState extends State<HolaMundo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
    );
  }
}
