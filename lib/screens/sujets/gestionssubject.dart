import 'package:flutter/material.dart';
import './ficheSujets.dart';
import '../../constants/rabbit.dart';

class GestionsSujets extends StatefulWidget {
  @override
  _GestionsSujetsState createState() => _GestionsSujetsState();
}

class _GestionsSujetsState extends State<GestionsSujets> {
  List<Rabbit> rabbits = [
    Rabbit(name: "Lapin 1", age: 6, weight: 2.5),
    Rabbit(name: "Lapin 2", age: 8, weight: 3.0),
    Rabbit(name: "Lapin 3", age: 4, weight: 2.8),
    Rabbit(name: "Lapin 4", age: 6, weight: 2.5),
    Rabbit(name: "Lapin 5", age: 8, weight: 3.0),
    Rabbit(name: "Lapin 6", age: 4, weight: 2.8),
    Rabbit(name: "Lapin 7", age: 6, weight: 2.5),
    Rabbit(name: "Lapin 8", age: 8, weight: 3.0),
    Rabbit(name: "Lapin 9", age: 4, weight: 2.8),
    Rabbit(name: "Lapin 10", age: 6, weight: 2.5),
    Rabbit(name: "Lapin 11", age: 8, weight: 3.0),
    Rabbit(name: "Lapin 12", age: 4, weight: 2.8),
    // Ajoutez plus de lapins ici
  ];

  List<Rabbit> filteredRabbits = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRabbits = rabbits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Fond de l'appBar vert
        title: Text(
          'Gestions des Sujets',
          style: TextStyle(fontWeight: FontWeight.bold), // Titre en gras
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Retourner à la page précédente
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Fond gris clair
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      filterRabbits(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Rechercher un lapin...',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRabbits.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      color: Colors.white, // Fond de la carte en blanc
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              filteredRabbits[index].name,
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text('Âge: ${filteredRabbits[index].age} mois'),
                            Text('Poids: ${filteredRabbits[index].weight} kg'),
                            SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Naviguer vers la page de fiche des sujets
                                  Navigator.pushNamed(
                                    context,
                                    '/fiche_sujets',
                                    arguments: filteredRabbits[index],
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Bouton "Voir Plus" vert
                                ),
                                child: Text('Voir Plus'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterRabbits(String query) {
    List<Rabbit> searchResult = rabbits.where((rabbit) {
      return rabbit.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredRabbits = searchResult;
    });
  }
}
