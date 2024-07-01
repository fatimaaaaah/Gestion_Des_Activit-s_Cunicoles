import 'package:flutter/material.dart';

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
            _buildListItem('Dashboard', Icons.dashboard, 0),
            Divider(color: Colors.green, height: 1),
            _buildGroupList(
              'Sujets',
              [
                _buildListItem('Gestion Sujets', null, 1, fontSize: 16),
                _buildListItem('Sell Subjects', null, 2, fontSize: 16),
                _buildListItem('Buy Subjects', null, 6, fontSize: 16),
              ],
              Icons.newspaper, // icône commune pour le groupe
              groupFontSize: 20,
            ),
            Divider(color: Colors.green, height: 1),
            _buildGroupList(
              'Journals',
              [
                _buildListItem('Breeding Journal', null, 5, fontSize: 16),
                _buildListItem('Purchase Journal', null, 3, fontSize: 16),
                _buildListItem('Sales Journal', null, 4, fontSize: 16),
              ],
              Icons.book, // icône commune pour le groupe
              groupFontSize: 20,
            ),
            Divider(color: Colors.green, height: 1),
            _buildListItem('Rating Page', Icons.star, 7),
            Divider(color: Colors.green, height: 1),
            _buildListItem('Déconnexion', Icons.exit_to_app, -1, isLogout: true),
            Divider(color: Colors.green, height: 1),
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
              size: 20,
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
            size: 30,
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
