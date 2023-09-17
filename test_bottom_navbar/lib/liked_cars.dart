import 'package:flutter/material.dart';

class LikedCarsPage extends StatelessWidget {
  final List<Map<String, String>> likedCars;

  LikedCarsPage({required this.likedCars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 111, 252),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(137, 58, 4, 51),
        title: Text('Tykätyt kuvat'),
      ),
      body: ListView.builder(
        itemCount: likedCars.length,
        itemBuilder: (context, index) {
          final car = likedCars[index];
          return ListTile(
            title: Text(car['description'] ?? ''),
            leading: Image.asset(
              car['image'] ?? '',
              width: 120.0,
              height: 75.0,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
