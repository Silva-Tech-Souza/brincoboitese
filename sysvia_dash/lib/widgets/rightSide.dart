import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/main/main_screen.dart';

class RightSide extends StatefulWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  State<RightSide> createState() => _RightSideState();
}

String empresafilieal = "";

class _RightSideState extends State<RightSide> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_CadastroPartesState');
  TextEditingController senha = TextEditingController();
  TextEditingController users = TextEditingController();
  bool _passwordVisible = true;
  Color txtfreleaspre = Color.fromARGB(255, 0, 94, 138),
      txtfreleassou = Color.fromARGB(255, 255, 255, 255);
  Color colorsou = Color.fromARGB(255, 19, 102, 105),
      colorpreciso = const Color.fromARGB(255, 193, 246, 248);
  checkUser() async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
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
            (Route<dynamic> route) => false);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //login
  Future<String?> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);

      return "Erro ao fazer o login";
    }
    return null;
  }

  Future<String?> _authUser(String email, String senhas) async {
    if (email == null || senhas == null) {
      var snackBar = const SnackBar(
        content: Text("Preencha os campos corretamente.",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return "erro";
    } else {
      String? resposta;

      await signInWithEmailAndPassword(
              email.toString(), senhas.toString(), (e) => "Cadastro não confere")
          .then((value) => {
                resposta = value,
              });

      if (resposta != null) {
        var snackBar = const SnackBar(
          content: Text("Email e senha não conferem",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 34, 34, 34),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return "erro";
      } else {
        return null;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkUser();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
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
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: sizeW * 0.10,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: colorsou,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(232, 36, 36, 36)
                                  .withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(1, -1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          child: Text(
                            "Bom Retiro",
                            style: TextStyle(color: txtfreleassou),
                          ),
                          onPressed: () {
                            setState(() {
                              empresafilieal = "bom retiro";
                              colorpreciso =
                                  const Color.fromARGB(255, 193, 246, 248);
                              txtfreleassou =
                                  Color.fromARGB(255, 255, 255, 255);
                              txtfreleaspre = Color.fromARGB(255, 0, 94, 138);
                              colorsou = Color.fromARGB(255, 19, 102, 105);
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: sizeW * 0.10,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: colorpreciso,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(232, 36, 36, 36)
                                  .withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(1, -1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          child: Text(
                            "Brás",
                            style: TextStyle(color: txtfreleaspre),
                          ),
                          onPressed: () {
                            setState(() {
                              empresafilieal = "bras";
                              txtfreleaspre =
                                  Color.fromARGB(255, 255, 255, 255);
                              txtfreleassou = Color.fromARGB(255, 0, 94, 138);
                              colorsou =
                                  const Color.fromARGB(255, 193, 246, 248);
                              colorpreciso = Color.fromARGB(255, 19, 102, 105);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: sizeW * 0.50,
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(50, 15, 50, 15)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 130, 51, 233))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              String? resposta;
                              await _authUser(
                                      "${users.text}@gmail.com.br", senha.text)
                                  .then((value) {
                                resposta = value;
                              });
                              if (resposta == null) {
                                await usuario!.loadUser();

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
                              } else {}
                            } on FirebaseAuthException catch (e) {}
                          }
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
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
