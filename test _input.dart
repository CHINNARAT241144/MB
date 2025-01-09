import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodMenuApp(),
    );
  }
}

class FoodMenuApp extends StatefulWidget {
  @override
  _FoodMenuAppState createState() => _FoodMenuAppState();
}

class _FoodMenuAppState extends State<FoodMenuApp> {
  // รายการเมนูอาหาร
  final List<Map<String, dynamic>> _menuItems = [
    {'name': 'ข้าวผัด', 'price': 50, 'selected': false},
    {'name': 'ก๋วยเตี๋ยว', 'price': 40, 'selected': false},
    {'name': 'ส้มตำ', 'price': 60, 'selected': false},
    {'name': 'ต้มยำกุ้ง', 'price': 120, 'selected': false},
    {'name': 'ไก่ย่าง', 'price': 100, 'selected': false},
  ];

  double _totalPrice = 0.0; // ราคารวมเริ่มต้น

  // คำนวณราคาทั้งหมด
  void _calculateTotalPrice() {
    setState(() {
      _totalPrice = _menuItems
          .where((item) => item['selected'])
          .fold(0.0, (sum, item) => sum + item['price']);
    });
  }

  // เปลี่ยนสถานะการเลือกของเมนู
  void _toggleSelection(int index) {
    setState(() {
      _menuItems[index]['selected'] = !_menuItems[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูอาหาร'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // แสดงรายการเมนู
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = _menuItems[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        menuItem['selected']
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        color: menuItem['selected'] ? Colors.green : Colors.grey,
                      ),
                      title: Text(menuItem['name']),
                      subtitle: Text('ราคา: ${menuItem['price']} บาท'),
                      onTap: () => _toggleSelection(index), // กดเพื่อเลือก/ยกเลิกเลือก
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // ปุ่มคำนวณราคาทั้งหมด
            ElevatedButton(
              onPressed: _calculateTotalPrice,
              child: Text('คำนวณราคารวม'),
            ),
            SizedBox(height: 16),
            // แสดงราคารวม
            Text(
              'ราคารวมทั้งหมด: $_totalPrice บาท',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
