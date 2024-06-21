import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import './acceuil/home.dart';


class MySliderScreen extends StatelessWidget {
  const MySliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    "assets/images/welcome5.gif",
    "assets/images/test-voix.gif",
    "assets/images/gagnerr.gif",
    "assets/images/devenir.gif",
    "assets/images/incident.gif",
  ];

  final List<String> titles = [
    "QOS Ambassadors",
    "Tester",
    "Gagner",
    "Devenir",
    "Remonter",
  ];

  final List<String> subtitles = [
    "Bienvenue dans la communauté des QOS Ambassadors",
    "Tester la qualité réseau et voix.",
    "Participer aux challenges pour gagner des cadeaux.",
    "Faites le plus de tests possibles et devenez le meilleur des ambassadeurs.",
    "Remonter les incidents pour suivi.",
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
                            //bottom: 60.0,
                            child: Text(
                              titles[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
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
                    height: 400.0, // Augmentez la hauteur des slides
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
                          MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      //  elevation: MaterialStateProperty.all<double>(0.6),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            return const HomePage();
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
                          color: Colors.deepOrange,
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
                            Colors.deepOrange, // Couleur du point actif
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
