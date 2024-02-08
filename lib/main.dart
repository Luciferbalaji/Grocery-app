import 'package:flutter/material.dart';
import 'package:grocery_shop/model/cart_model.dart';
import 'package:grocery_shop/pages/fintro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
      ),
    );
  }
}
