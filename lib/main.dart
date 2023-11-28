import 'package:api/bloc/products_bloc.dart';
import 'package:api/repo/products_repo.dart';
import 'package:api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => ProductRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(ProductRepo()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
