import 'package:api/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Product(),));
          },
        ),
      ),
    );
  }
}
