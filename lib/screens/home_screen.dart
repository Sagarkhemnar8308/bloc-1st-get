import 'package:api/screens/product_screen.dart';
import 'package:api/screens/user_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Get Data"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Product(),));
              },
            ),
          ),
            Center(
            child: ElevatedButton(
              child: const Text("Get Users"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const UserScreen(),));
              },
            ),
          ),
        ],
      ),
    );
  }
}
