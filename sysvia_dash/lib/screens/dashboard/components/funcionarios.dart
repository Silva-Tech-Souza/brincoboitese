import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../controllers/MenuController.dart';
import '../../../controllers/funcionario.dart';
import '../../../models/RecentFile.dart';
import '../../../widgets/constants.dart';
import '../../main/main_screen.dart';
import '../dashboard_screen.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({Key? key}) : super(key: key);

  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  final db = FirebaseFirestore.instance;
  var dbfilter;
  final List<Funcionarios> list = [];

  getUsers() async {
    final snapshot = await FirebaseDatabase.instance.ref('Users').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    setState(() {});
    map.forEach((key, value) {
      final user = Funcionarios.fromMap(value);

      list.add(user);
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: db.collection("Uses").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Funcionários",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          cadfunionario = true;
                          cadclientes = false;
                          cadinsumo = false;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: defaultPadding,
                    minWidth: 600,
                    columns: const [
                      DataColumn(
                        label: Text(
                          "Nome",
                          style: TextStyle(
                              color: Color.fromARGB(235, 255, 255, 255)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Referência",
                          style: TextStyle(
                              color: Color.fromARGB(235, 255, 255, 255)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Cargo",
                          style: TextStyle(
                              color: Color.fromARGB(235, 255, 255, 255)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Ativo",
                          style: TextStyle(
                              color: Color.fromARGB(235, 255, 255, 255)),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Editar",
                          style: TextStyle(
                              color: Color.fromARGB(235, 255, 255, 255)),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      list.length,
                      (index) => recentFileDataRow(
                          demoRecentFiles[index], list[index]),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Funcionários",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        funionario = true;
                        cadfunionario = true;
                        cadclientes = false;
                        cadinsumo = false;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo, Funcionarios listafunc) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            const Icon(Icons.person, size: 30, color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                listafunc.nome.toString(),
                style:
                    const TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
      DataCell(Text(
        listafunc.referencia.toString(),
        style: const TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
      )),
      DataCell(Text(
        listafunc.cargo.toString(),
        style: const TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
      )),
      const DataCell(Text(
        "Ativo",
        style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
      )),
      DataCell(
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    ],
  );
}
