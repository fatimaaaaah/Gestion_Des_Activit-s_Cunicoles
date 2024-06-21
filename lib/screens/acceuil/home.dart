import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:fl_chart/fl_chart.dart'; // Assurez-vous d'ajouter cette dépendance à votre pubspec.yaml

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des activités cunicoles',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
    Colors.purple,
    Colors.pink,
    Colors.green,
    Colors.orange,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gestion des activités cunicoles',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: _appBarColors[_selectedIndex],
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
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.medical_services),
    title: const Text("Gestion Santé"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.restaurant_menu),
    title: const Text("Gestion Nourriture"),
    selectedColor: Colors.green,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.pets),
    title: const Text("Gestion Reproduction"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profil"),
    selectedColor: Colors.teal,
  ),
];

// Tableau de bord pour les éleveurs
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: <Widget>[
                DashboardCard(
                  icon: Icons.pets,
                  title: 'Nombre de lapins',
                  value: '150', // Exemple de valeur
                  color: Colors.purple,
                  onTap: () {},
                ),
                DashboardCard(
                  icon: Icons.pregnant_woman,
                  title: 'Lapins en gestation',
                  value: '30', // Exemple de valeur
                  color: Colors.pink,
                  onTap: () {},
                ),
                DashboardCard(
                  icon: Icons.fastfood,
                  title: 'Stock de nourriture',
                  value: '200 kg', // Exemple de valeur
                  color: Colors.green,
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
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LineChartSample1(),
          ),
        ],
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
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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

// Exemples de graphiques et de gestion
class LineChartSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 3),
              FlSpot(2, 10),
              FlSpot(3, 7),
              FlSpot(4, 12),
              FlSpot(5, 13),
              FlSpot(6, 17),
            ],
            isCurved: true,
            color: Colors.purple,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

class HealthManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gestion Santé'),
    );
  }
}

class FoodManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gestion Nourriture'),
    );
  }
}

class ReproductionManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gestion Reproduction'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profil'),
    );
  }
}
