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
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Color.fromARGB(220, 207, 207, 207)),
        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        floatingLabelStyle:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        hintText: "Pesquisar",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 130, 51, 233),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("images/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
