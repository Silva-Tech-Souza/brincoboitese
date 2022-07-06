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

class RecentCleintes extends StatefulWidget {
  const RecentCleintes({Key? key}) : super(key: key);

  @override
  _RecentCleintesState createState() => _RecentCleintesState();
}

class _RecentCleintesState extends State<RecentCleintes> {
  final db = FirebaseFirestore.instance;
  var dbfilter;
  final List<Funcionarios> list = [];
  Color txtfreleaspre = Color.fromARGB(255, 0, 94, 138),
      txtfreleassou = Color.fromARGB(255, 255, 255, 255);
  Color colorsou = Color.fromARGB(255, 19, 102, 105),
      colorpreciso = const Color.fromARGB(255, 193, 246, 248);
  bool pessoa = true;
  getUsers() async {
    final snapshot = await FirebaseDatabase.instance.ref('Users').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    setState(() {});
    map.forEach((key, value) {
      final user = Funcionarios.fromMap(value);

      list.add(user);
    });
  }

  final _formKey = GlobalKey<FormState>(debugLabel: '_CadastroEmpresaState');
  TextEditingController linkedin = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController cnpjcpfc = TextEditingController();
  TextEditingController ceplink = TextEditingController();
  TextEditingController nomeEmpresa = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController datanasc = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController descricao = TextEditingController();

  TextEditingController link = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: !cadclientes
          ? StreamBuilder<QuerySnapshot>(
              stream: db.collection("Users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Clientes",
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
                          "Clientes",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              cadfunionario = false;
                              cadclientes = true;
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
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: sizeW * 0.30,
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
                              "Pessoa Jurídica",
                              style: TextStyle(color: txtfreleassou),
                            ),
                            onPressed: () {
                              setState(() {
                                pessoa = false;
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
                          width: sizeW * 0.30,
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
                              "Pessoa Física",
                              style: TextStyle(color: txtfreleaspre),
                            ),
                            onPressed: () {
                              setState(() {
                                pessoa = true;
                                txtfreleaspre =
                                    Color.fromARGB(255, 255, 255, 255);
                                txtfreleassou = Color.fromARGB(255, 0, 94, 138);
                                colorsou =
                                    const Color.fromARGB(255, 193, 246, 248);
                                colorpreciso =
                                    Color.fromARGB(255, 19, 102, 105);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  !pessoa
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: sizeW,
                              //    height: sizeW * 0.16,
                              child: TextFormField(
                                maxLength: 80,
                                controller: nomeEmpresa,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.business,
                                    color: Colors.white,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 135, 184, 224)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 1, 97, 207)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color.fromARGB(228, 194, 226, 247),
                                  filled: true,
                                  labelText: "Razão Social",
                                ),
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: sizeW * 0.25,
                              // height: sizeW * 0.17,
                              child: TextFormField(
                                controller: email,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.business_center_sharp,
                                    color: Colors.white,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 135, 184, 224)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 1, 97, 207)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color.fromARGB(228, 194, 226, 247),
                                  filled: true,
                                  labelText: "CNPJ",
                                ),
                                validator: (value) {},
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: sizeW * 0.32,
                              //   height: sizeW * 0.17,
                              child: TextFormField(
                                maxLength: 15,
                                controller: celular,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.local_convenience_store_rounded,
                                    color: Colors.white,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 135, 184, 224)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 1, 97, 207)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color.fromARGB(228, 194, 226, 247),
                                  focusColor:
                                      Color.fromARGB(228, 194, 226, 247),
                                  hoverColor:
                                      Color.fromARGB(228, 194, 226, 247),
                                  suffixIconColor:
                                      Color.fromARGB(228, 194, 226, 247),
                                  prefixIconColor:
                                      Color.fromARGB(228, 194, 226, 247),
                                  filled: true,
                                  labelText: "Inscrição Estadual",
                                ),
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: sizeW + 0.9,
                              child: TextFormField(
                                maxLength: 9,
                                controller: cep,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.map_rounded,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 135, 184, 224)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 1, 97, 207)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color.fromARGB(228, 194, 226, 247),
                                  filled: true,
                                  labelText: "Endereço Completo com CEP",
                                ),
                                validator: (value) {},
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: sizeW * 0.8,
                              child: TextFormField(
                                controller: link,
                                keyboardType: TextInputType.url,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 135, 184, 224)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 1, 97, 207)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color.fromARGB(228, 194, 226, 247),
                                  filled: true,
                                  labelText: "Email",
                                ),
                                validator: (value) {},
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 50,
                                    width: sizeW * 0.30,
                                    margin: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  232, 36, 36, 36)
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
                                        "Salvar",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              SizedBox(
                                width: sizeW,
                                //    height: sizeW * 0.16,
                                child: TextFormField(
                                  maxLength: 80,
                                  controller: nomeEmpresa,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 135, 184, 224)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(255, 1, 97, 207)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    filled: true,
                                    labelText: "Nome Completo",
                                  ),
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW * 0.25,
                                // height: sizeW * 0.17,
                                child: TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.person_pin_circle_outlined,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 135, 184, 224)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(255, 1, 97, 207)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    filled: true,
                                    labelText: "CPF",
                                  ),
                                  validator: (value) {},
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW * 0.32,
                                //   height: sizeW * 0.17,
                                child: TextFormField(
                                  maxLength: 15,
                                  controller: celular,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.perm_contact_calendar_rounded,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 135, 184, 224)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(255, 1, 97, 207)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    focusColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    hoverColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    suffixIconColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    prefixIconColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    filled: true,
                                    labelText: "RG",
                                  ),
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW + 0.9,
                                child: TextFormField(
                                  maxLength: 9,
                                  controller: cep,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.map_rounded,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 135, 184, 224)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(255, 1, 97, 207)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    filled: true,
                                    labelText: "Endereço Completo com CEP",
                                  ),
                                  validator: (value) {},
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW * 0.8,
                                child: TextFormField(
                                  controller: link,
                                  keyboardType: TextInputType.url,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 135, 184, 224)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(255, 1, 97, 207)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor:
                                        Color.fromARGB(228, 194, 226, 247),
                                    filled: true,
                                    labelText: "Email",
                                  ),
                                  validator: (value) {},
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    Container(
                                      height: 50,
                                      width: sizeW * 0.30,
                                      margin: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    232, 36, 36, 36)
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
                                          "Salvar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ])),
                            ]),
                ],
              ),
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
                style:
                    const TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
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
      DataCell(const Text(
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
