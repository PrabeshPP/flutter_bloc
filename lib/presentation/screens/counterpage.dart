import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/countercubit.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/second");
            },
            child: Text("Second Page"),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(onPressed: () {
            Navigator.of(context).pushNamed("/third");
          },
          child:Text("Third Page") ,)
        ],
      ),
    );
  }
}
