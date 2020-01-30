import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_x_flutter/presentation/bloc/product/bloc.dart';
import 'package:project_x_flutter/presentation/widgets/drawer.dart';
import 'package:project_x_flutter/presentation/widgets/loading_widget.dart';
import 'package:project_x_flutter/presentation/widgets/message_display.dart';
import 'package:project_x_flutter/presentation/widgets/product_list.dart';

import '../../injection_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Öko App'),
        ),
        body: Container(child: buildBody(context)),
        drawer: MyDrawer("Home"));
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

  BlocProvider<ProductBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>()..add(GetDetailsForProducts()),
      child: Container(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is Empty || state is Loading) {
              return LoadingWidget();
            } else if (state is LoadedProducts) {
              return RefreshIndicator(
                  onRefresh: () {
                    BlocProvider.of<ProductBloc>(context)
                        .add(GetDetailsForProducts());
                    return Future.value(null);
                  },
                  child: ProductList(products: state.products));
            } else if (state is Error) {
              return MessageDisplay(
                message: state.message,
              );
            }
          },
        ),
      ),
    );
  }
}
