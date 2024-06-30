import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projetlicence/screens/profil/profil.dart';
import '../drawer/drawer_screen.dart';
import '../notifications/notifcation_tap.dart';
import '../profil/profil.dart'; 
import '../deconnexion/deconnexion.dart';
import '../sujets/ficheSujets.dart';
import '../sujets/gestionsSubject.dart';
import '../sujets/sellSubjectsPage.dart';
import '../sujets/buySubjectsPage.dart';
import '../journals/breedingJournalPage.dart';
import '../journals/purchaseJournalPage.dart';
import '../journals/salesJournalPage.dart';
import '../notations/ratingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation when the page is first displayed
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Accueil',
          style: TextStyle(fontWeight: FontWeight.bold), // Titre en gras
        ),
        centerTitle: true, // Centrer le titre de l'appbar
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications), // Icône de notification par défaut
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotitcationTap()),
                  );
                },
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '2', // Remplacez par le nombre de notifications non lues
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.user), // Icône utilisateur de FontAwesome
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigue vers la page de profil
                );
              },
            ),
          ),
        ],
      ),
      drawer: MyDrawer(
        selectedIndex: 0, // Mettez à jour selectedIndex selon l'état de votre application
        onItemTapped: (index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/'); // Accueil
      break;
    case 1:
      Navigator.pushNamed(context, '/gestion_sujets'); // Gestion Sujets
      break;
    case 2:
      Navigator.pushNamed(context, '/sell_subjects'); // Sell Subjects
      break;
    case 3:
      Navigator.pushNamed(context, '/purchase_journal'); // Purchase Journal
      break;
    case 4:
      Navigator.pushNamed(context, '/sales_journal'); // Sales Journal
      break;
    case 5:
      Navigator.pushNamed(context, '/notification_tap'); // Notification Tap
      break;
    case 6:
      Navigator.pushNamed(context, '/breeding_journal'); // Breeding Journal
      break;
    case 7:
      Navigator.pushNamed(context, '/buy_subjects'); // Buy Subjects
      break;
    case 8:
      Navigator.pushNamed(context, '/rating_page'); // Rating Page
      break;
    default:
      break;
  }
},

        onLogoutTapped: () {
          Navigator.pushNamed(context, '/deconnexion'); // Déconnexion
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine the number of columns dynamically based on screen width
          int crossAxisCount = (constraints.maxWidth / 150).floor(); // Adjust 150 as needed for card width
          crossAxisCount = crossAxisCount.clamp(1, 3); // Limit between 1 and 3 columns

          return ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  AnimatedCard(
                    animation: _animation,
                    delay: 0,
                    child: const DashboardCard(
                      icon: FontAwesomeIcons.paw,
                      title: 'Total Lapins',
                      value: '100',
                      color: Colors.green,
                    ),
                  ),
                  AnimatedCard(
                    animation: _animation,
                    delay: 200,
                    child: const DashboardCard(
                      icon: FontAwesomeIcons.stethoscope,
                      title: 'Lapins Malades',
                      value: '2',
                      color: Colors.green,
                    ),
                  ),
                  AnimatedCard(
                    animation: _animation,
                    delay: 400,
                    child: const DashboardCard(
                      icon: FontAwesomeIcons.heartbeat,
                      title: 'Lapins en Gestation',
                      value: '3',
                      color: Colors.green,
                    ),
                  ),
                  AnimatedCard(
                    animation: _animation,
                    delay: 600,
                    child: const DashboardCard(
                      icon: FontAwesomeIcons.box,
                      title: 'Stock de Nourriture',
                      value: '50kg',
                      color: Colors.green,
                    ),
                  ),
                  AnimatedCard(
                    animation: _animation,
                    delay: 800,
                    child: const DashboardCard(
                      icon: FontAwesomeIcons.moneyBill,
                      title: 'Ventes ce Mois',
                      value: '20',
                      color: Colors.green,
                    ),
                  ),
                  AnimatedCard(
                    animation: _animation,
                    delay: 1200,
                    child: const DashboardCard(
                      icon: FontAwesomeIcons.bell,
                      title: 'Rappels à Venir',
                      value: '5',
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,), // Espace entre les cartes et le texte suivant
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child:  Text(
                  "Activités de la semaine",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const TaskCard(
                title: 'Vérifier les stocks de nourriture',
                description: 'Assurez-vous que les stocks de nourriture sont suffisants pour les lapins.',
              ),
              const TaskCard(
                title: 'Vaccination des lapins',
                description: 'Vérifiez les lapins qui doivent être vaccinés cette semaine.',
              ),
              const TaskCard(
                title: 'Nettoyer les enclos',
                description: 'Assurez-vous que les enclos sont propres pour prévenir les maladies.',
              ),
              const SizedBox(height: 20,), // Espace entre les cartes et le texte suivant
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Conseils du jour",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const AdviceCard(
                title: 'Bien-être des lapins',
                description: 'Assurez-vous que vos lapins disposent d\'un espace suffisant pour se déplacer et jouer. Un bon espace contribue à leur bien-être général.',
              ),
              const AdviceCard(
                title: 'Alimentation équilibrée',
                description: 'Variez l\'alimentation de vos lapins en incluant des légumes frais et des granulés de haute qualité. Évitez les aliments trop riches en sucre.',
              ),
              const AdviceCard(
                title: 'Surveillez la santé',
                description: 'Observez quotidiennement vos lapins pour détecter tout signe de maladie ou de stress. Une intervention précoce peut prévenir des problèmes plus graves.',
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  final Animation<double> animation;
  final int delay;
  final Widget child;

  AnimatedCard({required this.animation, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              icon,
              size: 40.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 3.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String description;

  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2.0,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: IconButton(
          icon: Icon(Icons.check_circle_outline),
          onPressed: () {
            // Ajoutez ici la logique pour marquer la tâche comme terminée
          },
        ),
      ),
    );
  }
}

class AdviceCard extends StatelessWidget {
  final String title;
  final String description;

  const AdviceCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2.0,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
