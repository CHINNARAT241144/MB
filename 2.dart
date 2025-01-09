import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputFormExample(),
    );
  }
}

class InputFormExample extends StatefulWidget {
  @override
  _InputFormExampleState createState() => _InputFormExampleState();
}

class _InputFormExampleState extends State<InputFormExample> {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final String input1 = _number1Controller.text;
    final String input2 = _number2Controller.text;

    if (input1.isNotEmpty && input2.isNotEmpty) {
      final double num1 = double.tryParse(input1) ?? 0;
      final double num2 = double.tryParse(input2) ?? 0;

      setState(() {
        _result = 'ผลรวม: ${(num1 + num2).toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _result = 'กรุณากรอกตัวเลขให้ครบ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input สำหรับเลขตัวแรก
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'กรอกตัวเลขที่ 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Input สำหรับเลขตัวที่สอง
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'กรอกตัวเลขที่ 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // ปุ่มคำนวณ
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('คำนวณผลรวม'),
            ),
            SizedBox(height: 20),
            // แสดงผลลัพธ์
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
