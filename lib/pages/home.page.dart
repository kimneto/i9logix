import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool menuLateral = true;

  _mudaMenu() {
    setState(() {
      menuLateral = !menuLateral;
      print(menuLateral);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Row(
        children: [
          Visibility(
            visible: menuLateral,
            child: Expanded(
              flex: 1,
              child: Scaffold(
                appBar: AppBar(),
                body: Container(
                  color: Colors.grey,
                  child: ListView(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 100,
                        child: Text('PESSOAL'),
                      ),
                      Container(
                        color: Colors.amber,
                        height: 100,
                        child: Text('LOGISTICA'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: menuLateral ? 4 : 5,
            child: Scaffold(
              persistentFooterButtons: [
                Text('Meus Módulos'),
                Icon(Icons.home),
              ],
              appBar: AppBar(
                leading: GestureDetector(
                  child: Icon(Icons.menu),
                  onTap: () => _mudaMenu(),
                ),
                actionsIconTheme: IconThemeData(size: 50),
                automaticallyImplyLeading: true,
                actions: [
                  Icon(Icons.home),
                  Icon(Icons.home),
                  Icon(Icons.home),
                ],
              ),
              body: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  child: Center(
                    child: SizedBox(
                        width: 500,
                        height: 600,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Text('I9Logix'),
                              ],
                            ))),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget menuLateral() {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}
