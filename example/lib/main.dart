import 'package:flutter/material.dart';
import 'package:hold_on_pop/hold_on_pop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter HoldOnPop Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoldOnPop(
              popup: _buildPopup(context),
              child: const Text('Long press to show popup'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopup(BuildContext context) {
    final popupWidth = MediaQuery.of(context).size.width * 0.6;
    final popupHeight = popupWidth * 2 / 3;
    return Container(
      width: popupWidth,
      height: popupHeight,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Release finger to close popup',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
