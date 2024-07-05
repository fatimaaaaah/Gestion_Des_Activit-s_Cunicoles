import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../acceuil/home.dart';

class MySliderScreen extends StatelessWidget {
  const MySliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: MySlider(),
    );
  }
}

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final List<String> imageUrls = [
    "assets/images/description/10.png",
    "assets/images/description/1.png",
    "assets/images/description/6.png",
    "assets/images/description/3.jpg",
    "assets/images/description/9.jpg",
  ];

  final List<String> titles = [
    "Bienvenue",
    "Suivi des Lapins",
    "Gestion de l'Alimentation",
    "Suivi de Santé",
    "Gestion Reproduction",
  ];

  final List<String> subtitles = [
    "Bienvenue dans votre application de gestion des activités cunicoles",
    "Gérez efficacement le suivi de vos lapins avec des fiches individuelles détaillées.",
    "Planifiez et surveillez l'alimentation de vos lapins pour une croissance optimale.",
    "Suivez la santé de vos lapins avec des rappels pour les soins et les vaccinations.",
    "Suivez et gérez les cycles de reproduction de vos lapins pour optimiser votre élevage.",
  ];

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  bool _showFinishButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: imageUrls.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print('Appuyé sur l\'élément $index');
                        }
                      },
                      child: Stack(
                        children: [
                          MySliderItem(imageUrl: imageUrls[index]),
                          Positioned(
                            top: 10.0,
                            left: 0.0,
                            right: 0.0,
                            child: Text(
                              titles[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 0.0,
                            right: 0.0,
                            child: Text(
                              subtitles[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 450.0, // Augmentez la hauteur des slides
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                        _showFinishButton =
                            _currentIndex == imageUrls.length - 1;
                      });
                    },
                    pageSnapping: false,
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Amener l'utilisateur au dernier slide
                      _carouselController.animateToPage(imageUrls.length - 1);
                    },
                    child: const Text(
                      'Passer',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  bottom: _showFinishButton ? 20.0 : -80.0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return  HomePage();
                          }),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.symmetric(
                            horizontal: _showFinishButton ? 20.0 : 0),
                        height: _showFinishButton ? 50.0 : 0,
                        width: 270,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(
                              _showFinishButton ? 15.0 : 0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Terminer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 180.0,
                  left: 0,
                  right: 0,
                  child: Visibility(
                    visible: !_showFinishButton,
                    child: DotsIndicator(
                      dotsCount: imageUrls.length,
                      position: _currentIndex.toInt(),
                      decorator: DotsDecorator(
                        color: Colors.grey[300]!, // Couleur des points inactifs
                        activeColor:
                            Colors.black, // Couleur du point actif
                        size: const Size.square(
                            12.0), // Augmentez la taille des points
                        activeSize: const Size(20.0, 12.0),
                        spacing: const EdgeInsets.all(2.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySliderItem extends StatelessWidget {
  final String imageUrl;

  MySliderItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(
        imageUrl,
        height: 360.0,
        width: 460.0,
        fit: BoxFit.cover,
      ),
    );
  }
}