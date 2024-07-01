import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../authentification/splashScreen.dart';

class DeconnexionPage extends StatefulWidget {
  const DeconnexionPage({super.key});

  @override
  State<DeconnexionPage> createState() => _DeconnexionPageState();
}

class _DeconnexionPageState extends State<DeconnexionPage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.all<double>(0.9),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Gestion des activités cunicoles',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?',
                  style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('NON',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  SplashScreen(),
                        ),
                      );
                  },
                  child: const Text('OUI',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
              ],
            );
          },
        );
      },
      child: const Row(
        children: [
          FaIcon(
            FontAwesomeIcons.rightFromBracket,
            color: Colors.green,
            size: 30,
          ),
          SizedBox(width: 16),
          Text(
            'Déconnexion',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
