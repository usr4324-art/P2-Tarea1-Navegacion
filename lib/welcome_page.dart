
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_drawer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const Color colorPrimario = Color(0xFF1565C0);
  static const Color colorFondo = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(
    title: const Text('Bienvenida'),
    backgroundColor: const Color(0xFF1565C0),
    foregroundColor: Colors.white,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
  ),
  drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          'Islas Canarias',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
