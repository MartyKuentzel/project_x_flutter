import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String category;
  final Int64 id;
  final String unit;
  final String name;
  final String price;
  final String creator;
  final String description;

  const Product(
      {@required this.category,
      @required this.id,
      @required this.unit,
      @required this.name,
      @required this.price,
      @required this.creator,
      @required this.description})
      : assert(category != null),
        assert(id != null),
        assert(unit != null),
        assert(name != null),
        assert(price != null),
        assert(creator != null),
        assert(description != null);

  @override
  List<Object> get props =>
      [category, id, unit, name, price, creator, description];
}
