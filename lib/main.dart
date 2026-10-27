import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

const Color rosaFondo = Color(0xFFFFF5F8);
const Color rosaTarjeta = Color(0xFFFFE4EC);
const Color rosaPrincipal = Color(0xFFE88EAD);
const Color rosaOscuro = Color(0xFF85445C);

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

void main() {
  runApp(const MiPortfolio());
}

class MiPortfolio extends StatefulWidget {
  const MiPortfolio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MiPortfolioState createState() => _MiPortfolioState();
}

class _MiPortfolioState extends State<MiPortfolio> {
  int _opcionBody = 0;

  final List<IconData> _iconosHobbies = [
    Icons.sports_esports, // World of Warcraft
    Icons.design_services, // Coser
    Icons.brush, // Manualidades
    Icons.restaurant, // Salir a comer
    Icons.videogame_asset, // Videojuegos
    Icons.movie, // Slashers
    Icons.local_movies, // Películas de miedo
    Icons.flutter_dash, // Pajaritos
    Icons.beach_access, // Playa
    Icons.catching_pokemon, // Pokémon
    Icons.favorite, // Cosas rosas
    Icons.code, // Programar
  ];

  Widget _buildHobbies() {
    final mitad = (hobbies.length / 2).ceil();

    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < mitad; i++) ...[
              ExtraObject(texto: hobbies[i], icono: _iconosHobbies[i]),
              const SizedBox(height: 10),
            ],
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = mitad; i < hobbies.length; i++) ...[
              ExtraObject(texto: hobbies[i], icono: _iconosHobbies[i]),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildRepositorio() {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(20),
      color: rosaTarjeta,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: rosaOscuro.withValues(alpha: 0.35), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Image.asset("assets/images/brave.webp", width: 140, fit: BoxFit.contain),
            ),
            const Text(
              "¡El navegador Brave sí que mola!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: rosaPrincipal, borderRadius: BorderRadius.circular(12)),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: rosaOscuro.withValues(alpha: 0.50), blurRadius: 8, offset: const Offset(0, 3)),
                    ],
                  ),
                  child: QrImageView(data: "https://github.com/lujanespinoza", version: QrVersions.auto, size: 150),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMascota() {
    return Card(
      color: rosaTarjeta,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/venus.jpg', width: 220, height: 220, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              'Venus',
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: rosaOscuro),
            ),
            const SizedBox(height: 10),
            const Text(
              '¡Hola! Soy Venus. Soy una ninfa de 7 años y me encanta comer y hacer ruido todas las mañanas '
              'para que mi dueña sepa que la quiero mucho. Me dejo coger y acariciar pero tampoco te pases que cuando me canse'
              ' te voy a picar. Sé que no soy un gato pero me gusta perseguir láseres, ¡algún día los atraparé!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final cabecera = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      color: rosaPrincipal,
      child: Center(
        child: Text(
          "Portfolio",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              cabecera,
              if (_opcionBody == 0) const PersonalPresentation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.all(10),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      layoutBuilder: (currentChild, previousChildren) {
                        return Stack(
                          alignment: Alignment.topCenter,
                          children: [...previousChildren, if (currentChild != null) currentChild],
                        );
                      },
                      child: _opcionBody == 0
                          ? _buildHobbies()
                          : _opcionBody == 1
                          ? _buildRepositorio()
                          : _buildMascota(),
                    ),
                  ),
                ),
              ), // Cuerpitos
              NavigationBar(
                backgroundColor: rosaTarjeta,
                selectedIndex: _opcionBody,
                onDestinationSelected: (index) {
                  setState(() {
                    _opcionBody = index;
                  });
                },
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.favorite), label: "Mis hobbies"),
                  NavigationDestination(icon: Icon(Icons.code), label: "Repositorio"),
                  NavigationDestination(icon: Icon(Icons.pets), label: 'Mascota'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalPresentation extends StatelessWidget {
  const PersonalPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(12),
      color: rosaTarjeta,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: rosaOscuro,
              child: Icon(Icons.person, size: 45, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Hola! Soy Lu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Me gusta aprender, crear proyectos '
                    'y descubrir nuevas tecnologías. Estos son algunos de mis hobbies, aparte de mi repositorio en GitHub :)',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtraObject extends StatelessWidget {
  final String texto;
  final IconData icono;

  const ExtraObject({super.key, required this.texto, required this.icono});

  static const espaciadosStail = EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
  static const textoStails = TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: rosaTarjeta,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: rosaPrincipal, width: 1.5),
        boxShadow: [BoxShadow(color: rosaOscuro.withValues(alpha: 0.5), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, color: rosaOscuro, size: 20),
            const SizedBox(width: 5),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(texto, style: textoStails.copyWith(color: rosaOscuro)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
