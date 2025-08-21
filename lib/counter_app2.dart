import 'package:flutter/material.dart';
import 'package:prov/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterApp2 extends StatefulWidget {
  const CounterApp2({super.key});

  @override
  State<CounterApp2> createState() => _CounterApp2State();
}

class _CounterApp2State extends State<CounterApp2> {
  int? count = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Set counter value: $count"),
            Text('Counter Value: ${provider.getCount}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.increment();
          setState(() {
            count = count! + 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
