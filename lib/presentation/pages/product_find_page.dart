import 'package:flutter/material.dart';
import 'package:project_x_flutter/presentation/routes/routes.dart';
import 'package:project_x_flutter/presentation/widgets/base_layout.dart';

class FindProductPage extends StatefulWidget {
  @override
  _FindProductPageState createState() => _FindProductPageState();
}

class _FindProductPageState extends State<FindProductPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(pageTitle: FIND_PRODUCT, body: Center(child: Text("Hi")));
  }
}
