import 'package:example_one/data/sale_items/sale_items_data.dart';
import 'package:example_one/extensions/immuteable_list_methods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/sale_item/sale_item.dart';

final allProductsProvider = FutureProvider.autoDispose<List<SaleItem>>((ref) async {
  final products = await SaleItemsData.getAllItems();
  return products.map((e) => SaleItem.fromJson(e)).toList();
});

class AllProductsProviderNotifier extends StateNotifier<List<SaleItem>> {
  AllProductsProviderNotifier() : super([]);

  addProduct(SaleItem saleItem) {
    state = state.withNew(saleItem);
  }
}
