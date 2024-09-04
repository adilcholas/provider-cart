import 'package:flutter/material.dart';

class ProductsModel {
  static List<String> itemNames = [
    'Flutter',
    'React',
    'Node',
    'Android',
    'Swift',
    'Go',
    'Angular',
    'Laravel',
    'Django',
    'Frog',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
