import 'package:flutter/foundation.dart';
import 'package:provider_cart/models/products_model.dart';

class CartProvider extends ChangeNotifier {
  late ProductsModel _catalog;

  final List<int> _itemIds = [];

  ProductsModel get catalog => _catalog;

  set catalog(ProductsModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}