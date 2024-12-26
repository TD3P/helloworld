import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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
      _logger.i('カウンターが増加しました');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 208, 208),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押した回数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('$_counter'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('$_counter'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('$_counter'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_drama),
            ),
            FilledButton(
              onPressed: () {},
              child: Text('$_counter'),
            ),
            FilledButton.tonal(
              onPressed: () {},
              child: Text('$_counter'),
            ),
          ],
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
