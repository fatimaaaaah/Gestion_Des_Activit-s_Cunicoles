import 'package:flutter/material.dart';
import 'package:projetlicence/screens/deconnexion/deconnexion.dart';

class MyDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onLogoutTapped;

  const MyDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onLogoutTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
            _buildListItem('Tableau de Bord', Icons.dashboard, 0, fontSize: 20),
            Divider(color: Colors.white, height: 1),
            _buildListItem('Alimentation', Icons.food_bank_outlined, 1, fontSize: 20),
            Divider(color: Colors.white, height: 1),
            _buildGroupList(
              'Lapins',
              [
                _buildListItem('Gestion Lapins', null, 2, fontSize: 18),
                _buildListItem('Mise en vente de Lapins', null, 3, fontSize: 18),
                _buildListItem('Achat de Lapins', null, 4, fontSize: 18),
               
              ],
              Icons.newspaper, // icône commune pour le groupe
              groupFontSize: 20,
            ),
            Divider(color: Colors.white, height: 1),
            _buildGroupList(
              'Journals',
              [
                _buildListItem('Journal de Reproduction', null, 5, fontSize: 18),
                _buildListItem('Journal de Vaccination', null, 6, fontSize: 18),
                _buildListItem('Journal des Ventes', null, 7, fontSize: 18),
                _buildListItem('Journal des Achats', null, 8, fontSize: 18),
              ],
              Icons.book, // icône commune pour le groupe
              groupFontSize: 20,
            ),
            Divider(color: Colors.white, height: 1),
            _buildListItem('Notations', Icons.star, 9, fontSize: 20),
            Divider(color: Colors.white, height: 1),
             const DeconnexionPage(),
            Divider(color: Colors.white, height: 1),
            const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Version',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  Spacer(),
                  Text(
                    '1.0.0',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, IconData? icon, int index, {bool isLogout = false, double fontSize = 20}) {
    return ListTile(
      title: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: Colors.green,
              size: fontSize * 1.5, // Ajustement de la taille de l'icône en fonction de la taille de la police
            ),
            SizedBox(width: 16),
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.green,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () {
        if (!isLogout) {
          onItemTapped(index);
        } else {
          onLogoutTapped();
        }
      },
    );
  }

  Widget _buildGroupList(String groupName, List<Widget> items, IconData groupIcon, {double groupFontSize = 20}) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(
            groupIcon,
            color: Colors.green,
            size: groupFontSize * 1.5, // Ajustement de la taille de l'icône du groupe
          ),
          SizedBox(width: 8),
          Text(
            groupName,
            style: TextStyle(
              color: Colors.green,
              fontSize: groupFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      children: items,
    );
  }
}

