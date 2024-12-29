import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../components/counter_display.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _logger = Logger();

  void _incrementCounter() {
    setState(() {
      _counter++;
      _logger.i('カウンターが増加しました$_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: CounterDisplay(
          counter: _counter,
          onIncrement: _incrementCounter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ),
    );
  }
}
