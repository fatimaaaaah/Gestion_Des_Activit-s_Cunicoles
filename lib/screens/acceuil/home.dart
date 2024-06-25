import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../gestionNourriture/gestionNourriture.dart';
import '../gestionReproduction/gestionReproduction.dart';
import '../gestionSante/gestionSante.dart';
import '../profil/profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des activités cunicoles',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _pages = [
    DashboardScreen(),
    HealthManagementScreen(),
    FoodManagementScreen(),
    ReproductionManagementScreen(),
    ProfileScreen(),
  ];

  final _appBarColors = [
    Colors.green,
    Colors.pink,
    Colors.green,
    Colors.orange,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        selectedItemColor: _appBarColors[_selectedIndex],
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Accueil"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.medical_services),
    title: const Text("Santé"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.restaurant_menu),
    title: const Text("Nourriture"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.pets),
    title: const Text("Reproduction"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profil"),
    selectedColor: Colors.green,
  ),
];

// Tableau de bord pour les éleveurs
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 8, // Ajustement de l'espacement entre les cartes
              mainAxisSpacing: 8, // Ajustement de l'espacement entre les lignes
              childAspectRatio: 1.2, // Ajustement du ratio largeur/hauteur
              children: <Widget>[
                DashboardCard(
                  icon: Icons.pets,
                  title: 'Nombre de lapins',
                  value: '150', // Exemple de valeur
                  color: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  icon: Icons.pregnant_woman,
                  title: 'Lapins en gestation',
                  value: '30', // Exemple de valeur
                  color: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  icon: Icons.fastfood,
                  title: 'Stock de nourriture',
                  value: '200 kg', // Exemple de valeur
                  color: Colors.orange,
                  onTap: () {},
                ),
                DashboardCard(
                  icon: Icons.local_hospital,
                  title: 'Lapins malades',
                  value: '5', // Exemple de valeur
                  color: Colors.orange,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2,
              children: <Widget>[
                Text('Pour vous'),
                OptionCard(
                  icon: Icons.dashboard,
                  title: 'Option 1',
                  color: Colors.blue,
                  onTap: () {},
                ),
                OptionCard(
                  icon: Icons.settings,
                  title: 'Option 2',
                  color: Colors.red,
                  onTap: () {},
                ),
                OptionCard(
                  icon: Icons.notifications,
                  title: 'Option 3',
                  color: Colors.yellow,
                  onTap: () {},
                ),
                OptionCard(
                  icon: Icons.info,
                  title: 'Option 4',
                  color: Colors.brown,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 48, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const OptionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 48, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
