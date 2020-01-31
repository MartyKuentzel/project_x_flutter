import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_x_flutter/data/models/product_model.dart';
import 'package:project_x_flutter/presentation/bloc/product/bloc.dart';
import 'package:project_x_flutter/presentation/routes/routes.dart';
import 'package:project_x_flutter/presentation/widgets/base_layout.dart';
import 'package:project_x_flutter/presentation/widgets/drawer.dart';

import 'package:fixnum/fixnum.dart';

class SellProductPage extends StatefulWidget {
  @override
  _SellProductPageState createState() => _SellProductPageState();
}

class _SellProductPageState extends State<SellProductPage> {
  final controller = TextEditingController();
  String inputStr;

  String _name;
  String _description;
  String _category;
  String _price;
  String _unit;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        pageTitle: SELL_PRODUCT,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Placeholder(fallbackHeight: 200),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              TextField(
                //  controller: controller,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Name des Produktes',
                ),
                onChanged: (val) => setState(() => _name = val),
                onSubmitted: (_) {
                  print("was");
                },
              ),
              SizedBox(height: 10),
              TextField(
                //     controller: controller,
                textAlign: TextAlign.left,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Beschreibung des Produktes',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide()),
                ),
                onChanged: (val) => setState(() => _description = val),
                onSubmitted: (_) {
                  print("was");
                },
              ),
              SizedBox(height: 10),
              TextField(
                //     controller: controller,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Kategorie',
                ),
                onChanged: (val) => setState(() => _category = val),
                onSubmitted: (_) {
                  print("was");
                },
              ),
              // OutlineButton(
              //     onPressed: () => null,
              //     child: Container(
              //       height: 55,
              //       child: Stack(
              //         children: <Widget>[
              //           Align(
              //               alignment: Alignment.centerLeft,
              //               child: Text(
              //                 "Kategorie",
              //                 textAlign: TextAlign.center,
              //               ))
              //         ],
              //       ),
              //     ),
              //     highlightedBorderColor: Colors.orange,
              //     color: Colors.green,
              //     borderSide: new BorderSide(color: Colors.green),
              //     shape: new RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(10.0))),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    //         controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Preis',
                    ),
                    onChanged: (val) => setState(() => _price = val),
                    onSubmitted: (_) {
                      print("was");
                    },
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    //         controller: controller,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Pro Menge',
                    ),
                    onChanged: (val) => setState(() => _unit = val),
                    onSubmitted: (_) {
                      print("was");
                    },
                  ))
                ],
              )
            ]),
          ),
          SizedBox(height: 20),
        ]))),
        bottomNavigationBar: Row(children: <Widget>[
          Expanded(
            child: Container(
              height: 50,
              child: RaisedButton(
                child: Text('Sell Item'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchCreateProduct,
              ),
            ),
          )
        ]));
  }

  void dispatchCreateProduct() {
    print("submit");
    BlocProvider.of<ProductBloc>(context).add(CreateProductEntry(ProductModel(
        category: _category,
        name: _name,
        unit: _unit,
        price: _price,
        creator: "marty",
        id: Int64(0),
        description: _description)));
  }
}
