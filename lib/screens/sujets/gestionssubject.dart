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

    Rabbit(name: "Mamadou", age: 6, weight: 2.5, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Awa", age: 8, weight: 3.0, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Samba", age: 4, weight: 2.8, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Ndeye", age: 6, weight: 2.5, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Adama", age: 8, weight: 3.0, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Khady", age: 4, weight: 2.8, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Malick", age: 6, weight: 2.5, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Fatou", age: 8, weight: 3.0, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Ngor", age: 4, weight: 2.8, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Binta", age: 6, weight: 2.5, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Ousmane", age: 8, weight: 3.0, gender: 'Masculin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    Rabbit(name: "Diarra", age: 4, weight: 2.8, gender: 'Féminin', imagePath: '../../../assets/images/achatsLapins/background.jpg'),
    // Ajoutez plus de lapins ici si nécessaire
  ];

  List<Rabbit> filteredRabbits = [];
  TextEditingController searchController = TextEditingController();

  // Filtering parameters
  String selectedGender = 'Tous';
  double minAge = 0;
  double maxAge = 12;
  double minWeight = 0;
  double maxWeight = 5;

  @override
  void initState() {
    super.initState();
    filteredRabbits = rabbits;
  }

  void filterRabbits() {
    List<Rabbit> searchResult = rabbits.where((rabbit) {
      return rabbit.name.toLowerCase().contains(searchController.text.toLowerCase()) &&
             (selectedGender == 'Tous' || rabbit.gender == selectedGender) &&
             rabbit.age >= minAge && rabbit.age <= maxAge &&
             rabbit.weight >= minWeight && rabbit.weight <= maxWeight;
    }).toList();

    setState(() {
      filteredRabbits = searchResult;
    });
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
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Genre:', style: TextStyle(fontSize: 18)),
                            DropdownButton<String>(
                              value: selectedGender,
                              items: ['Tous', 'Masculin', 'Féminin'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                  filterRabbits();
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Âge (mois):', style: TextStyle(fontSize: 18)),
                            RangeSlider(
                              values: RangeValues(minAge, maxAge),
                              min: 0,
                              max: 12,
                              divisions: 12,
                              activeColor: Colors.black, // Couleur active en noir
                              inactiveColor: Colors.grey[400], // Couleur inactive en gris
                              labels: RangeLabels('$minAge', '$maxAge'),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  minAge = values.start;
                                  maxAge = values.end;
                                  filterRabbits();
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Poids (kg):', style: TextStyle(fontSize: 18)),
                            RangeSlider(
                              values: RangeValues(minWeight, maxWeight),
                              min: 0,
                              max: 5,
                              divisions: 10,
                              activeColor: Colors.black, // Couleur active en noir
                              inactiveColor: Colors.grey[400], // Couleur inactive en gris
                              labels: RangeLabels('$minWeight', '$maxWeight'),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  minWeight = values.start;
                                  maxWeight = values.end;
                                  filterRabbits();
                                });
                              },
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Appliquer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
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
                      filterRabbits();
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
                    filterRabbits(); // Update the filter after adding a new rabbit
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
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GestionsSujets(),
  ));
}
