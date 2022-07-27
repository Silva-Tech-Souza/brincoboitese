import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../controllers/MenuController.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/responsive.dart';
import '../dashboard_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        !Responsive.isMobile(context)
            ? const Text(
                "Seja Bem Vindo!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF212332),
                ),
              )
            : Container(),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatefulWidget {
  ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  void initState() {
    super.initState();
    trazerdados();
  }

  trazerdados() async {
    await usuario!.loadUser();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return !Responsive.isMobile(context)
        ? Container(
            margin: EdgeInsets.only(left: defaultPadding),
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                Icon(Icons.person, size: 30, color: Colors.white),
                if (!Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: Text(
                      usuario!.nome.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          )
        : Container();
  }
}

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);
  List<List<String>> tipoempresa = [
    ["Lucas add um cliente"]
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: SizedBox(
        height: 30,
        width: 40,
        child: DropdownButton<String>(
          onChanged: (_) {},
          // Hide the default underline
          underline: Container(),
          hint: const Center(
              child: Text(
            'Notificação',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          isExpanded: true,
          style: const TextStyle(
            fontSize: 14,
          ),
          // The   list of options
          items: tipoempresa[0]
              .map((e) => DropdownMenuItem(
                    onTap: () {},
                    value: e,
                    child: Container(
                        width: 150,
                        height: 120,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              e.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 46, 46, 46),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateTime.now().toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 46, 46, 46),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ))
              .toList(),
        ),
      ), /*IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notification_important,
              size: 30, color: Colors.white),
        )*/
    );
  }
}
