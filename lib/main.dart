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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
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
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card( //ครอบ Card เพื่อสร้างกรอบขาวๆนูนๆลอยขึ้นมา
            elevation: 4, //เพิ่มเงา
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), //มุมกรอบให้โค้งมน
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0), //ระยะห่างในกรอบ
              child: Column(
                mainAxisSize: MainAxisSize.min, //ให้กรอบสูงพอดีกับเนื้อหา
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'คำนวณลิตรเป็นแกลลอน (US)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "แกลลอน (US) = ${area.toStringAsFixed(2)}", //ทศนิยม 2 ตำแหน่ง
                    style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _literController,
                    keyboardType: TextInputType.number, //คีย์บอร์ดขึ้นเป็นตัวเลข
                    decoration: const InputDecoration(
                      labelText: "ลิตร",
                      icon: Icon(Icons.hourglass_bottom),
                      iconColor: Colors.indigo,
                      //ใส่กรอบสี่เหลี่ยมให้ช่องใส่เลขข้อมูล
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => calculate(),
                    child: const Text("คำนวณ"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
