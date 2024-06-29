import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../deconnexion/deconnexion.dart';

class MyDrawer extends StatefulWidget {
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
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isSujetsExpanded = false;
  bool _isJournalsExpanded = false;

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
            selected: widget.selectedIndex == 0,
            onTap: () {
              widget.onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.white),
          _buildCategory(
            context,
            title: 'Sujets',
            icon: FontAwesomeIcons.moneyCheck,
            isExpanded: _isSujetsExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isSujetsExpanded = expanded;
              });
            },
            children: [
              _buildSubListItem(context, 'Gestion sujets', 1, widget.onItemTapped),
              _buildSubListItem(context, 'Fiches sujets', 2, widget.onItemTapped),
              _buildSubListItem(context, 'Achats sujets', 3, widget.onItemTapped),
              _buildSubListItem(context, 'Mise en vente de sujets', 4, widget.onItemTapped),
              _buildSubListItem(context, 'Notation de sujets', 5, widget.onItemTapped),
            ],
          ),
          const Divider(color: Colors.white),
          _buildCategory(
            context,
            title: 'Journals',
            icon: FontAwesomeIcons.newspaper,
            isExpanded: _isJournalsExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isJournalsExpanded = expanded;
              });
            },
            children: [
              _buildSubListItem(context, 'Journal de reproduction', 6, widget.onItemTapped),
              _buildSubListItem(context, 'Journal des achats', 7, widget.onItemTapped),
              _buildSubListItem(context, 'Journal des ventes', 8, widget.onItemTapped),
              _buildSubListItem(context, 'Journal de vaccination', 9, widget.onItemTapped),
            ],
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

  Widget _buildCategory(
      BuildContext context, {
        required String title,
        required IconData icon,
        required bool isExpanded,
        required Function(bool) onExpansionChanged,
        required List<Widget> children,
      }) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        unselectedWidgetColor: Colors.white, // Change la couleur des icônes d'expansion
      ),
      child: ExpansionTile(
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
        onExpansionChanged: onExpansionChanged,
        initiallyExpanded: isExpanded,
        iconColor: Colors.white, // Change la couleur de l'icône d'expansion lorsqu'elle est dépliée
      ),
    );
  }

  Widget _buildSubListItem(
      BuildContext context, String title, int index, Function(int) onItemTapped) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: widget.selectedIndex == index,
      onTap: () {
        onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}
