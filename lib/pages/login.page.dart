import 'package:flutter/material.dart';
import 'package:i9logix/config/custom.theme.dart';
import 'package:i9logix/pages/home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color linkTexto = Colors.black45;
  bool verLogin = true;

  _acendeLinkTexto(PointerEvent details) {
    setState(() {
      linkTexto = Colors.black87;
      verLogin = false;
    });
  }

  _apagaLinkTexto(PointerEvent details) {
    setState(() {
      linkTexto = Colors.black45;
      verLogin = true;
    });
  }

  Widget logo() {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 40.0,
        child: Icon(
          verLogin ? Icons.person : Icons.lock,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(LOGINWALLPAPER),
                fit: BoxFit.fill,
              ),
            ),
            alignment: Alignment.center,
            child: Expanded(
              flex: 1,
              child: SizedBox(
                width: 340,
                height: 600,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 30,
                          offset: Offset(5, 5),
                          spreadRadius: 2.0)
                    ],
                    color: Color.fromARGB(200, 254, 254, 254),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'I9Logix',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        logo(),
                        SizedBox(
                          height: 10,
                        ),
                        email,
                        SizedBox(
                          height: 10,
                        ),
                        verLogin
                            ? password
                            : SizedBox(
                                height: 48,
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        loginButton,
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: MouseRegion(
                            onExit: _apagaLinkTexto,
                            onHover: _acendeLinkTexto,
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(color: linkTexto),
                            ),
                          ),
                          onPressed: () {
                            print(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

final email = TextFormField(
  keyboardType: TextInputType.number,
  autofocus: false,
  decoration: InputDecoration(
    hintText: 'CPF',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

final password = TextFormField(
  autofocus: false,
  initialValue: 'Senha',
  obscureText: true,
  decoration: InputDecoration(
    hintText: 'Senha',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

final loginButton = Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.blue)))),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.only(left: 48, right: 48, top: 10, bottom: 10),
      child: Text('ENTRAR', style: TextStyle(color: Colors.white)),
    ),
  ),
);
