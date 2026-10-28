import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                colorFilter: ColorFilter.mode(Color(0x40FFFFFF), BlendMode.darken),
              ),
            ),
          ),
          const Positioned(top: 200, left: 0, right: 0, child: Icon(Icons.landscape, size: 100, color: Colors.white)),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Black border
                Text(
                  'Islas Canarias',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.satisfy(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black,
                  ),
                ),

                // White filling
                Text(
                  'Islas Canarias',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.satisfy(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 80,
            left: 10,
            right: 10,
            child: Text(
              'Las mejores experiencias de cada isla en un solo lugar',
              textAlign: TextAlign.center,
              style: GoogleFonts.yesevaOne(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
