import 'package:flutter/material.dart';
import 'package:take_care/screens/home_screen.dart/widget/money_list.dart';
import 'package:take_care/screens/home_screen.dart/widget/total_amount.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TotalAmount(),
        SizedBox(
          height: 10,
        ),
        Expanded(child: MoneyList()),
      ],
    );
  }
}
