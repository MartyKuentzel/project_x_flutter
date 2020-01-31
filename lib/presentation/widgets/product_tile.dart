import 'package:flutter/material.dart';
import 'package:project_x_flutter/domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final ThemeData theme;
  //final NumberFormat formatter;

  ProductTile({@required this.product, this.theme});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/product-detail',
              arguments: (product.name),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 11,
                // child: Image.asset(
                //   product.assetName,
                //   package: product.assetPackage,
                //   fit: BoxFit.fitWidth,
                // ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: theme.textTheme.title,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        product.price,
                        //   formatter.format(product.price),
                        style: theme.textTheme.body2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
