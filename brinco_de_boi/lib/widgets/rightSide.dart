import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../screens/main/main_screen.dart';

class RightSide extends StatefulWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_CadastroPartesState');
  TextEditingController senha = TextEditingController();
  TextEditingController users = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Entre no sistema ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 1),
                    ),
                    Text(
                      'SysVia',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 130, 51, 233),
                          letterSpacing: 2),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'Insira seus dados abaixo',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )),
                SizedBox(
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 400,
                  child: TextFormField(
                    controller: users,
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      hintText: '',
                      icon: Image.asset('images/user.png'),
                      // prefix: Image.asset('images/user.png'),
                      // prefixIcon: Icon(Icons.person),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey)),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Esse campo é obrigatório!';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    controller: senha,
                    maxLength: 12,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          !_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      icon: Image.asset('images/closed-lock.png'),
                      // prefix: Image.asset('images/closed-lock.png'),
                      // prefixIcon: Icon(Icons.person),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey)),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Esse campo é obrigatório!';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.fromLTRB(50, 15, 50, 15)),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 130, 51, 233))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiProvider(
                                    providers: [
                                      ChangeNotifierProvider(
                                        create: (context) => MenuController(),
                                      ),
                                    ],
                                    child: MainScreen(),
                                  ),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {}
                          }
                        },
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
