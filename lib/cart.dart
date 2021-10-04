import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc1/cartmodel.dart';
import 'package:velocity_x/velocity_x.dart';

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
     
      appBar: AppBar(
        title: Text("Cart pages"),
      ),
      body:(ItemModel.item!=null && ItemModel.item!.isNotEmpty)? Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: ItemModel.item!.length,
                itemBuilder: (context, index) {
                  final model = ItemModel.item![index];
                  return Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(onTap: (){
                          

                          },child: Icon(Icons.minimize_outlined).pOnly(right: 12)),
                          Column(
                            children: [
                              Container(height: 70,
                              width:80,
                              child: Image.network(model.img,fit:BoxFit.fill,)),
                              Text(model.name),
                            ],
                          ),
                          InkWell(onTap: (){

                          },child: Icon(CupertinoIcons.add).pOnly(left: 12))
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                gradient: LinearGradient(end: Alignment.bottomCenter
                ,begin: Alignment.topCenter,colors: [Colors.deepOrangeAccent,Colors.blue])
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("\$100",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold

                  ),)
                ],
              ),
            ),
          )
        ],
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}

