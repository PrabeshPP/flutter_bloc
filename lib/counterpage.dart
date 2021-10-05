import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/counterCubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
         
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: BlocBuilder(builder: (context, state) {
        return Text("$state");
      }),
    );
  }
}
