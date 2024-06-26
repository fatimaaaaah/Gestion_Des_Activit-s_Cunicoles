import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../deconnexion/deconnexion.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onLogoutTapped,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;
  final Function() onLogoutTapped;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white12,
            ),
            child: Center(
              child: Text(
                'GESTION DES ACTIVITES CUNICOLES',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Acceuil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const FaIcon(
              FontAwesomeIcons.home,
              color: Colors.green,
              size: 30,
            ),
            selected: selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          
          const Divider(color: Colors.white),
          _buildCategory(
            context,
            title: 'Sujets',
            icon: FontAwesomeIcons.book,
            children: [
              _buildSubListItem(context, 'Gestion sujets', 1, onItemTapped),
              _buildSubListItem(context, 'Fiches sujets', 2, onItemTapped),
              _buildSubListItem(context, 'Achats sujets', 3, onItemTapped),
              _buildSubListItem(context, ' Mise en vente de sujets', 4, onItemTapped),
              _buildSubListItem(context, ' Notation de sujets', 5, onItemTapped),
              _buildSubListItem(context, ' Notation de sujets', 5, onItemTapped),
            ],
          ),
          const Divider(color: Colors.white),
          _buildCategory(
            context,
            title: 'Journals',
            icon: FontAwesomeIcons.book,
            children: [
              _buildSubListItem(context, 'Journal de reproduction', 1, onItemTapped),
              _buildSubListItem(context, 'Journal des achats', 2, onItemTapped),
              _buildSubListItem(context, 'Journal des ventes', 3, onItemTapped),
              _buildSubListItem(context, 'Journal de vaccination', 4, onItemTapped),
            ],
          ),
            const Divider(color: Colors.white),
          ListTile(
            title: const Text(
              'Tableau de bord',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const FaIcon(
              FontAwesomeIcons.chartLine,
              color: Colors.green,
              size: 30,
            ),
            selected: selectedIndex == 6,
            onTap: () {
              onItemTapped(6);
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.white),
          const DeconnexionPage(),
          const Divider(color: Colors.white),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Version',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Spacer(),
                Text(
                  '1.0.0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context,
      {required String title,
      required IconData icon,
      required List<Widget> children}) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: FaIcon(
        icon,
        color: Colors.green,
        size: 30,
      ),
      children: children,
    );
  }

  Widget _buildSubListItem(
      BuildContext context, String title, int index, Function(int) onItemTapped) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: selectedIndex == index,
      onTap: () {
        onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}
