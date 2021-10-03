import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/cart.dart';
import 'package:flutter_bloc1/counterCubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.deepOrangeAccent,
                size: 40,
              ),
            ),
            BlocBuilder<CounterCubit, int>(builder: (context, state) {
              return Text(
                "$state",
                style: TextStyle(fontSize: 45),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(CupertinoIcons.add),
        onPressed: () {
          context.read<CounterCubit>().increment();
        },
      ),
    );
  }
}
