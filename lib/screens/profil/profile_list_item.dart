import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, // Taille fixe pour l'exemple
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100], // Couleur de fond pour l'exemple
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 24, // Taille de l'icône pour l'exemple
            color: Colors.black, // Couleur de l'icône pour l'exemple
          ),
          SizedBox(width: 12), // Espacement entre l'icône et le texte
          Text(
            text,
            style: TextStyle(
              fontSize: 16, // Taille du texte pour l'exemple
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (hasNavigation)
            Icon(
              Icons.arrow_forward_ios,
              size: 24, // Taille de l'icône de navigation pour l'exemple
              color: Colors.black, // Couleur de l'icône de navigation pour l'exemple
            ),
        ],
      ),
    );
  }
}
