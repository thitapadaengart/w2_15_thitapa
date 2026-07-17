import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _literController = TextEditingController();

  double liter = 0;
  double area = 0;

  void calculate() {
    liter = double.tryParse(_literController.text) ?? 0;

    print("width = $liter");

    setState(() {
      area = liter / 3.785;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('คำนวณลิตรเป็นแกลลอน (US)'),
            Text("แกลลอน (US) = $area"),
            TextField(
              controller: _literController,
              decoration: InputDecoration(
                labelText: "ลิตร",
                icon: Icon(Icons.hourglass_bottom),
                iconColor: Colors.indigo,
              ),
            ),
            ElevatedButton(
              onPressed: () => calculate(),
              child: Text("คำนวณ"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
