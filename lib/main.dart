import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'data.dart';

void main(){
  
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _titleController=TextEditingController();
  final _descController=TextEditingController();
  List<String> listProducts=[];
  late final database;


@override
  void initState(){
   
    selectData();
    super.initState();
  }

  void selectData() async{
    database=Database();
  (await database.select(database.productsView).get()).forEach((element) {listProducts.add(element.title);});
    
  //(await database.delete(database.productsView).go());
  setState(() {
    
  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
               child:Column(
                children: [
                    TextField(
              controller: _titleController,
            ),
            TextField(
              controller: _descController,
            ),
            ElevatedButton(onPressed: () async{
                await database.into(database.products).insert(ProductsCompanion.insert(title: _titleController.value.text, desc: _descController.value.text));

                //listProducts=await database.select(database.products).get();
                
                (await database.select(database.productsView).get()).forEach((element) {listProducts.add(element.title);});
                setState(() {
                });

                //print('result : $result'); 
                //print(listProducts);
                print(listProducts[0]);

            }, child: Text('Add')),
                ],
               )   
              ),
            ),
            
            Expanded(
              flex: 7,
              child: ListView.builder(
              shrinkWrap: true,
              itemCount: listProducts.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(listProducts[index]),
                );
              }
            )
            )
            
          ],
        ),
      ),
    );
  }
}