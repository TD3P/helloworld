import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({
    super.key,
    required this.counter,
    required this.onIncrement,
  });

  final int counter;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'ボタンを押した回数:',
        ),
        Text(
          '$counter',
          key: const Key('counter-value'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
          onPressed: onIncrement,
          child: Text('$counter'),
        ),
        OutlinedButton(
          onPressed: onIncrement,
          child: Text('$counter'),
        ),
        TextButton(
          onPressed: onIncrement,
          child: Text('$counter'),
        ),
        IconButton(
          onPressed: onIncrement,
          icon: const Icon(Icons.filter_drama),
        ),
        FilledButton(
          onPressed: onIncrement,
          child: Text('$counter'),
        ),
        FilledButton.tonal(
          onPressed: onIncrement,
          child: Text('$counter'),
        ),
      ],
    );
  }
}
