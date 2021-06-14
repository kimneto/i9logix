import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalStorage storage = new LocalStorage('some_key');

  @override
  Widget build(BuildContext context) {
    storage.setItem("soma_key", 190);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: Colors.black,
            child: Center(
              child: Container(
                height: constraints.maxHeight / 1.5,
                width: constraints.maxHeight / 1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(15)),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text('LOGIN'),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(60),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'CPF',
                                    ),
                                    Container(
                                      width: 300,
                                      color: Colors.red,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            fillColor: Colors.amber),
                                        maxLength: 11,
                                        keyboardType: TextInputType.number,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'PASSWORD HOLERITE',
                                    ),
                                    Container(
                                      width: 300,
                                      color: Colors.red,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            fillColor: Colors.amber),
                                        maxLength: 11,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "LOGAR",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )))
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
