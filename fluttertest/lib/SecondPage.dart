import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double bruttoTulot = 0.0;
  double veroprosentti = 0.0;
  double nettotulot = 0.0;

  void laskeNettotulot() {
    setState(() {
      nettotulot = bruttoTulot - (bruttoTulot * (veroprosentti / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nettotulolaskuri - Toisella Sivulla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Syötä bruttotulosi ja veroprosentti:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Bruttotulot'),
                onChanged: (value) {
                  setState(() {
                    bruttoTulot = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Veroprosentti'),
                onChanged: (value) {
                  setState(() {
                    veroprosentti = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: laskeNettotulot,
              child: Text('Laske Nettotulot'),
            ),
            SizedBox(height: 20),
            Text(
              'Nettotulot: $nettotulot €',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
