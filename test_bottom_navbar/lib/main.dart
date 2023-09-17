import 'package:flutter/material.dart';
import 'liked_cars.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> likedCars = [];
  String selectedCar = "assets/images/Passat.JPG";
  String carDescription = "Valitse auto";

  void changeCar(String carImage, String description) {
    setState(() {
      selectedCar = carImage;
      carDescription = description;
    });
  }

  void toggleLike(String carImage, String description) {
    setState(() {
      final carInfo = {'image': carImage, 'description': description};
      if (likedCars.contains(carInfo)) {
        likedCars.remove(carInfo);
      } else {
        likedCars.add(carInfo);
      }
    });
  }

  void navigateToLikedCars() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LikedCarsPage(likedCars: likedCars),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 111, 252),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(137, 58, 4, 51),
        title: Text('Autot'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: navigateToLikedCars,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => changeCar(
                    "assets/images/Passat.JPG", "VolksWagen Passat 2004"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0))),
                child: Text('Ensimmäinen auto'),
              ),
              ElevatedButton(
                onPressed: () =>
                    changeCar("assets/images/BMW320.JPG", "BMW 320d 2006"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0))),
                child: Text('Toinen auto'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => changeCar(
                    "assets/images/BMW330.jpg", "BMW 330xd 2006 M-Sport"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0))),
                child: Text('Kolmas auto'),
              ),
              ElevatedButton(
                onPressed: () => changeCar(
                    "assets/images/AudiA6.jpg", "Audi A6 2013 Competition"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0))),
                child: Text('Neljäs auto'),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      selectedCar,
                      width: 350.0,
                      height: 220.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    carDescription,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  IconButton(
                    iconSize: 36,
                    icon: Icon(
                        likedCars.contains({
                          'image': selectedCar,
                          'description': carDescription
                        })
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Color.fromARGB(255, 255, 0, 0)),
                    onPressed: () => toggleLike(selectedCar, carDescription),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Tykkää',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
