import 'package:flutter/material.dart';
import 'package:mj_calc_flutter/top_screen.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  //await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '麻雀 点数計算 練習アプリ',
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Hiragino Sans',
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF55C500),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              )),
      home: const TopScreen(),
    );
  }
}
