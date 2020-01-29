import 'package:flutter/material.dart';
import 'package:project_x_flutter/presentation/widgets/drawer.dart';

class FindProductPage extends StatefulWidget {
  @override
  _FindProductPageState createState() => _FindProductPageState();
}

class _FindProductPageState extends State<FindProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Item'),
      ),
      body: Center(child: Text("hi")),
      drawer: MyDrawer("Find Item"),
    );
  }
}
