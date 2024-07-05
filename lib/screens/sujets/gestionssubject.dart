import 'package:flutter/material.dart';
import 'package:projetlicence/screens/sujets/ficheSujets.dart';
import 'package:projetlicence/screens/sujets/addRabbitForm.dart';
import 'package:projetlicence/screens/sujets/editRabbitForm.dart'; // Importez le fichier du formulaire d'édition
import '../../constants/rabbit.dart';

class GestionsSujets extends StatefulWidget {
  @override
  _GestionsSujetsState createState() => _GestionsSujetsState();
}

class _GestionsSujetsState extends State<GestionsSujets> {
  List<Rabbit> rabbits = [
    Rabbit(name: "Lapin 1", age: 6, weight: 2.5, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Lapin 2", age: 8, weight: 3.0, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    // Ajoutez plus de lapins ici si nécessaire
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
        backgroundColor: Colors.green,
        title: const Text(
          'Gestions des Lapins',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200],
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
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                filteredRabbits[index].imagePath != null
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(filteredRabbits[index].imagePath!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[300],
                                        ),
                                        child: Icon(Icons.image),
                                      ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredRabbits[index].name,
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text('Âge: ${filteredRabbits[index].age} mois'),
                                    Text('Poids: ${filteredRabbits[index].weight} kg'),
                                    Text('Sexe: ${filteredRabbits[index].gender}'),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FicheSujets(rabbit: filteredRabbits[index]),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                      child: const Text(
                                        'Voir Plus',
                                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () async {
                                            Rabbit? updatedRabbit = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => EditRabbitForm(rabbit: filteredRabbits[index]),
                                              ),
                                            );

                                            if (updatedRabbit != null) {
                                              setState(() {
                                                rabbits[index] = updatedRabbit;
                                                filteredRabbits = rabbits;
                                              });
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            setState(() {
                                              rabbits.removeAt(index);
                                              filteredRabbits = rabbits;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRabbitForm(
                onAddRabbit: (newRabbit) {
                  setState(() {
                    rabbits.add(newRabbit);
                    filteredRabbits = rabbits;
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: Colors.green,
        tooltip: 'Ajouter un lapin',
        child: Icon(Icons.add),
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
