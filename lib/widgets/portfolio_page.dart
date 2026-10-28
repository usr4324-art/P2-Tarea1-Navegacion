
import 'package:flutter/material.dart';
import 'app_drawer.dart';

const Color primaryColor = Color(0xFF1565C0);
const Color secondaryColor = Color(0xFF4FC3F7);
const Color backgroundColor = Color(0xFFF5F7FA);
const Color textColor = Color(0xFF212121);

const List<String> hobbies = [
  "World of Warcraft",
  "Coser",
  "Manualidades",
  "Salir a comer",
  "Videojuegos",
  "Slashers",
  "Películas de miedo",
  "Pajaritos",
  "Playa",
  "Pokémon",
  "Cosas rosas",
  "Programar",
];

const List<IconData> hobbyIcons = [
  Icons.sports_esports,
  Icons.design_services,
  Icons.brush,
  Icons.restaurant,
  Icons.videogame_asset,
  Icons.movie,
  Icons.local_movies,
  Icons.flutter_dash,
  Icons.beach_access,
  Icons.catching_pokemon,
  Icons.favorite,
  Icons.code,
];

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mitad = (hobbies.length / 2).ceil();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('My Hobbies'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  for (int i = 0; i < mitad; i++) ...[
                    HobbyCard(
                      text: hobbies[i],
                      icon: hobbyIcons[i],
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  for (int i = mitad; i < hobbies.length; i++) ...[
                    HobbyCard(
                      text: hobbies[i],
                      icon: hobbyIcons[i],
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const HobbyCard({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: secondaryColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 20),
          const SizedBox(width: 5),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
