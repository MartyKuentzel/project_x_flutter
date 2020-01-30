import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer(this.currentPage);

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ingo"),
            accountEmail: Text("Ingo@web.de"),
            currentAccountPicture: GestureDetector(
                onTap: () => print("tap tap"),
                child: CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Ingo_Zamperoni_2016_04.jpg/220px-Ingo_Zamperoni_2016_04.jpg"),
                )),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ec3a0f25-e06a-4cde-85cd-761c5e46c0e4/d8eib00-037917dd-e188-4ee0-b098-ec3480c5f4dd.jpg/v1/fill/w_600,h_338,q_75,strp/low_poly_landscape__the_river_cut_by_bv_designs_d8eib00-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzM4IiwicGF0aCI6IlwvZlwvZWMzYTBmMjUtZTA2YS00Y2RlLTg1Y2QtNzYxYzVlNDZjMGU0XC9kOGVpYjAwLTAzNzkxN2RkLWUxODgtNGVlMC1iMDk4LWVjMzQ4MGM1ZjRkZC5qcGciLCJ3aWR0aCI6Ijw9NjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.UVPrPVXK33rQhyXd9qhbIZZZV54SktYXY-HmDw5q9XI"))),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 40)),
            ],
          ),
          ListTile(
            title: Text(
              "Home",
              style: this.currentPage == "Home"
                  ? TextStyle(fontWeight: FontWeight.bold)
                  : TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == "Home") return;
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text(
              "Find Item",
              style: this.currentPage == "Find Item"
                  ? TextStyle(fontWeight: FontWeight.bold)
                  : TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == "Find Item") return;
              Navigator.of(context).pushReplacementNamed('/find-product');
            },
          ),
          ListTile(
            title: Text(
              "Sell Item",
              style: this.currentPage == "Sell Item"
                  ? TextStyle(fontWeight: FontWeight.bold)
                  : TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              if (this.currentPage == "Sell Item") return;
              Navigator.of(context).pushReplacementNamed('/sell-product');
            },
          ),
        ],
      ),
    );
  }
}
