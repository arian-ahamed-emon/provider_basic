
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/counter_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Counter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Text('Counter value is : ${context.watch<CounterProvider>().count}'),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50,),
              IconButton(onPressed: (){
                context.read<CounterProvider>().decrementCounter();
              }, icon: Icon(Icons.remove)),
              IconButton(onPressed: (){
                context.read<CounterProvider>().incrementCounter();
              }, icon: Icon(Icons.add)),

              SizedBox(width: 50,),
            ],
          ),
        ],
      ),
    );
  }
}
