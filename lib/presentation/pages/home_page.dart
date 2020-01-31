import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_x_flutter/presentation/bloc/product/bloc.dart';
import 'package:project_x_flutter/presentation/routes/routes.dart';
import 'package:project_x_flutter/presentation/widgets/base_layout.dart';
import 'package:project_x_flutter/presentation/widgets/drawer.dart';
import 'package:project_x_flutter/presentation/widgets/loading_widget.dart';
import 'package:project_x_flutter/presentation/widgets/message_display.dart';
import 'package:project_x_flutter/presentation/widgets/product_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      pageTitle: HOME,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is Empty || state is Loading) {
            return LoadingWidget();
          } else if (state is LoadedProducts) {
            return RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<ProductBloc>(context)
                      .add(GetAllProductEntries());
                  return Future<void>.value(null);
                },
                child: ProductGrid(products: state.products));
          } else if (state is Error) {
            return MessageDisplay(
              message: state.message,
            );
          }
        },
      ),
    );
  }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Home")),
//         body: Container(
//             child: Consumer<ProductCatalog>(
//                 builder: (context, products, child) => ProductList(
//                       products: products.allProducts,
//                     ))),
//         drawer: MyDrawer("Home"));
//   }
// }

//         body: Container(
//             child: Consumer<ProductCatalog>(
//                 builder: (context, products, child) => ProductList(
//                       products: products.allProducts,
//                     ))),

}
