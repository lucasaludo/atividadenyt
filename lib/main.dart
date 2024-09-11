// main.dart
import 'package:flutter/material.dart';
import 'views/livros_views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT MAIS VENDIDOS',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BookListView(),
    );
  }
}
