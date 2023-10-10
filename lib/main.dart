import 'package:flutter/material.dart';
import 'package:invoice_maker_app/Screens/CartScreen.dart';
import 'package:invoice_maker_app/Screens/HomeScreen.dart';
import 'package:invoice_maker_app/Screens/ItemScreen.dart';
import 'package:invoice_maker_app/Screens/SplashScreen.dart';
import 'package:invoice_maker_app/Screens/pdf.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
       initialRoute: 'home',
      routes: {
        '/': (context) => SplashScreen(),
        'home': (context) => HomeScreen(),
        'item': (context) => ItemScreen(),
        'cart': (context) => CartScreen(),
        'pdf': (context) => PdfScreen(),
      },
    ),
  );
}
