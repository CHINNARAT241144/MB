import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/feed_page.dart';
import 'screens/discovery_page.dart';
import 'screens/activity_page.dart';
import 'screens/library_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Bar Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // กำหนดค่าดัชนีเริ่มต้นเพื่อแสดงหน้าแรก
  int _currentIndex = 0;

  // กำหนดหน้าใน Array
  final tabs = [
    Home(), // หน้าแรก
    Feed(), // หน้า Feed
    Discovery(), // หน้า Discovery
    Activity(), // หน้า Activity
    LibraryPage(), // หน้า Library
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex], // แสดงหน้าตามดัชนี
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // ดัชนีของหน้า
        onTap: (index) {
          setState(() {
            _currentIndex = index; // เปลี่ยนหน้าเมื่อกด
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: 'Discovery'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Activity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Library'),
        ],
      ),
    );
  }
}
