import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/countercubit.dart';
import 'package:flutter_bloc1/presentation/screens/second_screen.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => BlocProvider.value(
                  value:BlocProvider.of<Countercubit>(context),
                  child: SecondPage())));
          },
          label: Row(
            children: [Text("NextPage"), Icon(Icons.navigate_next)],
          )),
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Countercubit, int>(builder: (context, state) {
            return Text(
              "$state",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<Countercubit>().increment();
                  },
                  icon: Icon(
                    Icons.add,
                    size: 25,
                  )),
              IconButton(
                  onPressed: () {
                    context.read<Countercubit>().decrement();
                  },
                  icon: Icon(
                    CupertinoIcons.minus,
                    size: 25,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
