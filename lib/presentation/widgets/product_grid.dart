import 'package:flutter/material.dart';
import 'package:project_x_flutter/domain/entities/product.dart';

import 'package:project_x_flutter/presentation/widgets/product_tile.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  ProductGrid({@required this.products});
  @override
  Widget build(BuildContext context) {
    print("products: ${products[0].name}");
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children: getChildrenProducts(context),
    );
  }

  List<Widget> getChildrenProducts(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final NumberFormat formatter = NumberFormat.simpleCurrency(
    //     locale: Localizations.localeOf(context).toString());

    return products
        .map((item) => ProductTile(product: item, theme: theme))
        .toList();
  }
}
