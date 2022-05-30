import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../controllers/funcionario.dart';
import '../../../models/RecentFile.dart';
import '../../../widgets/constants.dart';

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
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: db.collection("Uses").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(
              snapshot.data!.docs.length,
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Funcionários",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: defaultPadding,
                    minWidth: 600,
                    columns: [
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
            return Container();
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
            Icon(Icons.person, size: 30, color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                listafunc.nome.toString(),
                style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
      DataCell(Text(
        listafunc.referencia.toString(),
        style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
      )),
      DataCell(Text(
        listafunc.cargo.toString(),
        style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
      )),
      DataCell(Text(
        "Ativo",
        style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
      )),
      DataCell(
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    ],
  );
}
