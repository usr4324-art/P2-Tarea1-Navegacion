import 'package:flutter/material.dart';

import 'app_drawer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const Color primaryColor = Color(0xFF1565C0);
  static const Color backgroundColor = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Bienvenida'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        leading: Builder(
          builder: (context) =>
              IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_background.webp'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Color(0x40FFFFFF), BlendMode.srcOver),
              ),
            ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: Icon(Icons.landscape, size: 60, color: Colors.white)),
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              'Islas Canarias',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(
              'Un paraíso por descubrir',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
