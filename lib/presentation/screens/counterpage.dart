import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/logic/cubit/countercubit.dart';
import 'package:flutter_bloc1/logic/cubit/internet_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter Page"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<Countercubit, int>(builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              }),
              Builder(builder: (context) {
                final CounterState = context.watch<Countercubit>().state;
                final internetState = context.watch<InternetCubit>().state;
                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text(
                    "Counter:$CounterState " + "Internet:Wifi",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text(
                    "Counter:$CounterState" + "Internet:No Internet",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  );
                }
              }),
              SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                final _counterCubit = context.watch<Countercubit>().state;
                return Text("Counter:$_counterCubit");
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
                child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.teal,
                              Colors.red,
                              Colors.deepOrange
                            ])),
                    child: Center(
                        child: Text(
                      "Second Page",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/third");
                },
                child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.teal,
                              Colors.red,
                              Colors.deepOrange
                            ])),
                    child: Center(
                        child: Text(
                      "Third Page",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
              )
            ]));
  }
}
