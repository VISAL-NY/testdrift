import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'data.g.dart';

class Products extends Table{
  IntColumn get id=>integer().autoIncrement()();
  TextColumn get title=>text()();
  TextColumn get desc=>text()();
}

abstract class ProductsView extends View{
  Products get products;

  Expression<String> get title;
  @override
  Query as()=>select([
    products.title
  ]).from(products);
}

@DriftDatabase(tables: [Products],views: [ProductsView])
class Database extends _$Database {

  Database():super(_openConnection());

  @override
  int get schemaVersion=>1;
}
LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder=await getApplicationDocumentsDirectory();
    final file=File(p.join(dbFolder.path,'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}