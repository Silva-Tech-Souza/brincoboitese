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
    return Drawer(
      backgroundColor: Color.fromARGB(255, 30, 32, 48),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("images/images/logo.png"),
          ),
          DrawerListTile(
            title: "Home",
            svgSrc: "images/icons/menu_dashbord.svg",
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
            title: "Clientes",
            svgSrc: "images/icons/menu_tran.svg",
            press: () async {
              setState(() {
                funionario = false;
                clientes = true;
                insumo = false;
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
            title: "Funcion??rios",
            svgSrc: "images/icons/menu_tran.svg",
            press: () async {
              setState(() {
                funionario = true;
                cadfunionario = false;
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
            title: "Insumo",
            svgSrc: "images/icons/menu_task.svg",
            press: () async {
              setState(() {
                funionario = false;
                clientes = false;
                cadinsumo = false;
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
            title: "Sair",
            svgSrc: "images/icons/menu_setting.svg",
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
