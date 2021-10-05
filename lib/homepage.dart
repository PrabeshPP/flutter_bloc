import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/counterCubit.dart';
import 'package:flutter_bloc1/counterpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(_)=>Counterubit(),
    child: CounterPage(),);
  }
}