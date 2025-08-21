import 'package:flutter/material.dart';
import 'package:prov/counter_app2.dart';
import 'package:prov/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int? count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) => Center(
          child: Column(
            children: [
              Text('Counter Value: $count'),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CounterApp2()));
                  },
                  child: Text("Next")),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    value.increment();
                    setState(() {
                      count = count! + 1;
                    });
                  },
                  child: child)
            ],
          ),
        ),
      ),
    );
  }
}
