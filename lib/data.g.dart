// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class ProductsViewData extends DataClass {
const ProductsViewData({});factory ProductsViewData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return ProductsViewData();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}ProductsViewData copyWith({}) => ProductsViewData();@override
String toString() {return (StringBuffer('ProductsViewData(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is ProductsViewData);
}class $ProductsViewView extends ViewInfo<$ProductsViewView, ProductsViewData> implements HasResultSet {
final String? _alias;
@override final _$Database attachedDatabase;
$ProductsViewView(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? entityName;
@override
 String get entityName=> 'products_view';
@override
 String? get createViewStmt => null;
@override
$ProductsViewView get asDslTable => this;
@override ProductsViewData map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return ProductsViewData();
}
@override
$ProductsViewView createAlias(String alias) {
return $ProductsViewView(attachedDatabase, alias);}@override
Query? get query => (attachedDatabase.selectOnly(null)..addColumns($columns));
      @override
      Set<String> get readTables => const {};
    
}
abstract class _$Database extends GeneratedDatabase{
_$Database(QueryExecutor e): super(e);
late final $ProductsViewView productsView = $ProductsViewView(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [productsView];
}
