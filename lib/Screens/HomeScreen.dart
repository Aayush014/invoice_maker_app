import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0F2C59),
          leading: const Icon(Icons.storefront, size: 30),
          title: const Text("Invoice Generator"),
        ),
        body: Center(
          child: InkWell(
            child: Container(
              height: 60,
              width: 190,
              decoration: const BoxDecoration(
                  color: Color(0xff0F2C59),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: const Center(
                child: Text(
                  "Create Invoice",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed('item'),
          ),
        ),
      ),
    );
  }
}