import 'package:flutter/material.dart';
import 'package:currency_wallet/screens/currency_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyScreen(),
    );
  }
}

