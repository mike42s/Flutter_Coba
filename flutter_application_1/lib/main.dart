import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];
final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          seconds: 2,
          navigateAfterSeconds: new _MyAppState(),
          title: new Text(
            'SplashScreen Example',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
          backgroundColor: Colors.lightBlue[200],
        ));
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GeeksForGeeks")),
      body: const Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carousel with indicator demo'),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                //scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: imagesList
                  .map((item) => Container(
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(item,
                                      fit: BoxFit.cover, width: 1000.0),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      child: Text(
                                        'No. ${imagesList.indexOf(item)} image',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.map((urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _currentIndex == index
                        ? const Color.fromRGBO(0, 0, 0, 0.8)
                        : const Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Oeschinen Lake Campground",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.0),
                          ),
                          Text("Kanderstag, Switzerland",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 16.0))
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.red),
                          Text("41")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        const Icon(
                          Icons.call,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Text("Call",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ),
                      ]),
                      Column(children: [
                        const Icon(
                          Icons.telegram,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Text("Route",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ),
                      ]),
                      Column(children: [
                        const Icon(
                          Icons.share,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Text("Share",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ),
                      ]),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                        'The future belongs to those who prepare for it today.The future belongs to those who prepare for it today.The future belongs to those who prepare for it today.The future belongs to those who prepare for it today.The future belongs to those who prepare for it today.The future belongs to those who prepare for it today.The future belongs to those who prepare for it today.',
                        style: const TextStyle(),
                        textAlign: TextAlign.left))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
