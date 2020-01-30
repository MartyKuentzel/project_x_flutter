import 'package:flutter/material.dart';
import 'package:project_x_flutter/presentation/widgets/drawer.dart';

class SellProductPage extends StatefulWidget {
  @override
  _SellProductPageState createState() => _SellProductPageState();
}

class _SellProductPageState extends State<SellProductPage> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sell Item'),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Placeholder(fallbackHeight: 200),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              TextField(
                controller: controller,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Name des Produktes',
                ),
                onChanged: (value) {
                  inputStr = value;
                },
                onSubmitted: (_) {
                  print("was");
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller,
                textAlign: TextAlign.left,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Beschreibung des Produktes',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide()),
                ),
                onChanged: (value) {
                  inputStr = value;
                },
                onSubmitted: (_) {
                  print("was");
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Kategorie',
                ),
                onChanged: (value) {
                  inputStr = value;
                },
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
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Preis',
                    ),
                    onChanged: (value) {
                      inputStr = value;
                    },
                    onSubmitted: (_) {
                      print("was");
                    },
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    controller: controller,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Pro Menge',
                    ),
                    onChanged: (value) {
                      inputStr = value;
                    },
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
                onPressed: () => print("ih"),
              ),
            ),
          )
        ]),
        drawer: MyDrawer("Sell Item"));
  }
}
