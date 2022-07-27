import '/screens/dashboard/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../controllers/MenuController.dart';
import '../../../main.dart';
import '../main_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Color.fromARGB(255, 30, 32, 48),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("images/images/logo.png"),
          ),
          Container(
            color: Color.fromARGB(115, 219, 219, 219),
            height: 1,
            width: sizeW * 0.5,
          ),
          const SizedBox(height: 25),
          DrawerListTile(
            title: "Home",
            svgSrc: "images/icons/home.svg",
            press: () {
              setState(() {
                funionario = false;
                clientes = false;
                insumo = false;
              });
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
            },
          ),
          DrawerListTile(
            title: "Serviços",
            svgSrc: "images/icons/servico.svg",
            press: () async {},
          ),
          DrawerListTile(
            title: "Clientes",
            svgSrc: "images/icons/cliente.svg",
            press: () async {
              setState(() {
                funionario = false;
                clientes = true;
                insumo = false;
                estoque = false;
                cadclientes = false;
              });
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
            },
          ),
          DrawerListTile(
            title: "Estoque",
            svgSrc: "images/icons/estoque.svg",
            press: () async {
              setState(() {
                funionario = false;
                clientes = false;
                insumo = false;
                cadclientes = false;
                estoque = true;
              });
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
            },
          ),
          DrawerListTile(
            title: "Matéria Prima",
            svgSrc: "images/icons/prima.svg",
            press: () async {
              setState(() {
                funionario = false;
                clientes = false;
                cadinsumo = false;
                estoque = false;
                insumo = true;
              });
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
            },
          ),
          DrawerListTile(
            title: "Funcionários",
            svgSrc: "images/icons/funcio.svg",
            press: () async {
              setState(() {
                funionario = true;
                cadfunionario = false;
                clientes = false;
                insumo = false;
                estoque = false;
              });
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
            },
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            title: "Sair",
            svgSrc: "images/icons/sair.svg",
            press: () async {
              //usuario!.limpar();
              await _signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
