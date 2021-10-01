import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc1/cartmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final jsonData = await rootBundle.loadString("Assets/bloc.json");
    final jsonDecodeData = jsonDecode(jsonData);
    var listData = jsonDecodeData["item"];
    ItemModel.item = List.from(listData).map((e) => Items.fromMap(e)).toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Cart pages"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: ItemModel.item!.length,
            itemBuilder: (context, index) {
              final model = ItemModel.item![index];
              return Container(
                child: Row(
                  children: [
                    Icon(Icons.minimize_outlined),
                    Text(model.name),
                    Icon(CupertinoIcons.add)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
