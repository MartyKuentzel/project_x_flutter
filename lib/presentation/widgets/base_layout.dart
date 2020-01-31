import 'package:flutter/material.dart';
import 'package:project_x_flutter/presentation/widgets/drawer.dart';

class BaseLayout extends StatelessWidget {
  final String pageTitle;
  final Object body;
  final Object bottomNavigationBar;
  const BaseLayout(
      {Key key,
      @required this.pageTitle,
      @required this.body,
      this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
        ),
        body: body,
        drawer: MyDrawer(pageTitle),
        bottomNavigationBar: bottomNavigationBar);
  }
}
