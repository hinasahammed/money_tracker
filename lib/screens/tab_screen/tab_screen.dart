import 'package:flutter/material.dart';
import 'package:take_care/screens/analytics_screen/analytics_screen.dart';
import 'package:take_care/screens/category_screen/category_screen.dart';
import 'package:take_care/screens/home_screen.dart/home_screen.dart';
import 'package:take_care/screens/tab_screen/widget/add_amount_sheet.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentindex = 0;
  void _selectIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  final _pages = [
    const HomeScreen(),
    const AnalyticsScreen(),
    const CategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Care'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        child: _pages[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
        ],
        onTap: _selectIndex,
        currentIndex: currentindex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return const AddAmountSheet();
        });
  }
}
