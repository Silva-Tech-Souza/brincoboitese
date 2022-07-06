import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../controllers/user.dart';
import '../../widgets/constants.dart';
import '../../widgets/responsive.dart';
import 'components/clientes.dart';
import 'components/header.dart';

import 'components/insumo.dart';
import 'components/my_fields.dart';
import 'components/funcionarios.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

Users? usuario = Users(id: FirebaseAuth.instance.currentUser!.uid.toString());
bool funionario = false;
bool clientes = false;
bool insumo = false;
bool cadfunionario = false;
bool cadclientes = false;
bool cadinsumo = false;
bool get tiposessao => funionario;
set tiposessao(bool tipos) {
  funionario = tipos;
}

bool get tiposessaoclientes => clientes;
set tiposessaoclientes(bool tipos) {
  clientes = tipos;
}

bool get tiposessaoinsomo => insumo;
set tiposessaoinsomo(bool tipos) {
  insumo = tipos;
}

bool get tiposessaocad => cadfunionario;
set tiposessaocad(bool tipos) {
  cadfunionario = tipos;
}

bool get tiposessaoclientescad => cadclientes;
set tiposessaoclientescad(bool tipos) {
  cadclientes = tipos;
}

bool get tiposessaoinsomocad => cadinsumo;
set tiposessaoinsomocad(bool tipos) {
  cadinsumo = tipos;
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // MyFiles(),
                      const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StarageDetails(),

                      usuario!.cargo.toString() == "admin" && funionario
                          ? const RecentFiles()
                          : Container(),

                      usuario!.cargo.toString() == "admin" && clientes
                          ? RecentCleintes()
                          : Container(),

                      usuario!.cargo.toString() == "admin" && insumo
                          ? RecentDespesas()
                          : Container(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
