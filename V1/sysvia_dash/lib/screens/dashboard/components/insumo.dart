import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controllers/MenuController.dart';
import '../../../controllers/funcionario.dart';
import '../../../models/RecentFile.dart';
import '../../../widgets/constants.dart';
import '../../main/main_screen.dart';
import '../dashboard_screen.dart';

class RecentDespesas extends StatefulWidget {
  const RecentDespesas({Key? key}) : super(key: key);

  @override
  _RecentDespesasState createState() => _RecentDespesasState();
}

class _RecentDespesasState extends State<RecentDespesas> {
  final db = FirebaseFirestore.instance;
  var dbfilter;
  final List<Funcionarios> list = [];
  TextEditingController razaosocial = TextEditingController();
  getUsers() async {
    final snapshot = await FirebaseDatabase.instance.ref('Users').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    setState(() {});
    map.forEach((key, value) {
      final user = Funcionarios.fromMap(value);

      list.add(user);
    });
  }

  final _formKey = GlobalKey<FormState>(debugLabel: '_RecentDespesasState');
  List<DataRow> _createRows(QuerySnapshot? snapshot) {
    try {
      List<DataRow> newList =
          snapshot!.docs.map((DocumentSnapshot documentSnapshot) {
        return DataRow(cells: [
          DataCell(Text(
            documentSnapshot.get('id').toString(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )),
          DataCell(Text(
            documentSnapshot.get('nome').toString() == "" ||
                    documentSnapshot.get('nome') == null
                ? documentSnapshot.get('razaosocial').toString()
                : documentSnapshot.get('nome').toString(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )),
          DataCell(Text(
            documentSnapshot.get('celular').toString(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )),
          DataCell(Text(
            documentSnapshot.get('email').toString(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )),
          DataCell(Text(
            documentSnapshot.get('email').toString(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )),
          DataCell(Text(
            documentSnapshot.get('endereco').toString(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
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
        ]);
      }).toList();
      return newList;
    } catch (_) {
      List<DataRow> newList = [];
      return newList;
    }
  }

  List<List<String>> tipoempresa = [
    ["KG", "MIL", "MT", "PAR", "PC", "PCT", "RL", "UN"]
  ];
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
      child: !cadinsumo
          ? StreamBuilder<QuerySnapshot>(
              stream: db.collection("Uses").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    width: sizeW,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: sizeW,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Matéria Prima",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: 38,
                                    width: 120,
                                    child: DropdownButton<String>(
                                      onChanged: (_) {},
                                      // Hide the default underline
                                      underline: Container(),
                                      hint: const Center(
                                          child: Text(
                                        'Bom Retiro',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 31, 31, 31)),
                                      )),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Color.fromARGB(255, 31, 31, 31),
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
                                                  width: 80,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    e.toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 46, 46, 46),
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    height: 48,
                                    width: sizeW * 0.25,
                                    child: TextField(
                                      style: const TextStyle(
                                          decorationColor: Color.fromARGB(
                                              255, 255, 255, 255),
                                          color:
                                              Color.fromARGB(255, 29, 29, 29)),
                                      decoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                220, 97, 97, 97)),
                                        labelStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        floatingLabelStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        hintText: "Pesquisar",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                defaultPadding * 0.80),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: defaultPadding / 2),
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 130, 51, 233),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Icon(Icons.search,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cadfunionario = false;
                                        cadinsumo = true;
                                        cadclientes = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: sizeW,
                          child: DataTable(
                            columnSpacing: defaultPadding,
                            columns: [
                              DataColumn(
                                label: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Referência',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(212, 182, 182, 182),
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Nome do Produto',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(212, 182, 182, 182),
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Unidade',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(212, 182, 182, 182),
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              DataColumn(
                                  label: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Estoque',
                                  style: TextStyle(
                                      color: Color.fromARGB(212, 182, 182, 182),
                                      fontSize: 17),
                                ),
                              )),
                              DataColumn(
                                label: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Custo',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(212, 182, 182, 182),
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Status',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(212, 182, 182, 182),
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Ação',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(212, 182, 182, 182),
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                            rows: _createRows(snapshot.data),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    width: sizeW,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Matéria Prima",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: 38,
                                    width: 120,
                                    child: DropdownButton<String>(
                                      onChanged: (_) {},
                                      // Hide the default underline
                                      underline: Container(),
                                      hint: const Center(
                                          child: Text(
                                        'Bom Retiro',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 31, 31, 31)),
                                      )),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Color.fromARGB(255, 31, 31, 31),
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
                                                  width: 80,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    e.toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 46, 46, 46),
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    height: 48,
                                    width: sizeW * 0.25,
                                    child: TextField(
                                      style: const TextStyle(
                                          decorationColor: Color.fromARGB(
                                              255, 255, 255, 255),
                                          color:
                                              Color.fromARGB(255, 29, 29, 29)),
                                      decoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                220, 97, 97, 97)),
                                        labelStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        floatingLabelStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        hintText: "Pesquisar",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                defaultPadding * 0.80),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: defaultPadding / 2),
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 130, 51, 233),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Icon(Icons.search,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cadfunionario = false;
                                        cadinsumo = true;
                                        cadclientes = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  );
                }
              },
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    width: sizeW,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              funionario = false;
                              clientes = true;
                              insumo = false;
                              cadclientes = false;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          "Cadastrar Matéria Prima",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    width: sizeW * 0.9,
                    color: Color.fromARGB(97, 230, 230, 230),
                    child: Container(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: sizeW * 0.25,
                    // height: sizeW * 0.17,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      enabled: false,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.password_outlined,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 135, 184, 224)),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromARGB(255, 1, 97, 207)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(228, 194, 226, 247),
                        filled: true,
                        labelText: "Código",
                      ),
                      validator: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: sizeW * 0.6,
                    //    height: sizeW * 0.16,
                    child: TextFormField(
                      maxLength: 80,
                      controller: razaosocial,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.production_quantity_limits,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 135, 184, 224)),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromARGB(255, 1, 97, 207)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(228, 194, 226, 247),
                        filled: true,
                        labelText: "Nome do Produto",
                      ),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return "Preencha corretamente!";
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: sizeW,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          width: sizeW * 0.2,
                          child: Container(
                            width: sizeW * 0.10,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 48,
                            child: DropdownButton<String>(
                              onChanged: (_) {},
                              // Hide the default underline
                              underline: Container(),
                              hint: const Center(
                                  child: Text(
                                'Unidade',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 31, 31, 31)),
                              )),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 31, 31, 31),
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
                                          width: 80,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            e.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 46, 46, 46),
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: sizeW * 0.02,
                        ),
                        SizedBox(
                          width: sizeW * 0.2,
                          child: TextFormField(
                            controller: razaosocial,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.circle,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 135, 184, 224)),
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
                              labelText: "Embalagem",
                            ),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return "Preencha corretamente!";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: sizeW * 0.2,
                    child: TextFormField(
                      controller: razaosocial,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 135, 184, 224)),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromARGB(255, 1, 97, 207)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(228, 194, 226, 247),
                        filled: true,
                        labelText: "Custo",
                      ),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return "Preencha corretamente!";
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: sizeW,
                    child: Row(
                      children: [
                        SizedBox(
                          width: sizeW * 0.2,
                          child: TextFormField(
                            controller: razaosocial,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              icon: Icon(
                                MdiIcons.package,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 135, 184, 224)),
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
                              labelText: "Estoque",
                            ),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return "Preencha corretamente!";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: sizeW * 0.02,
                        ),
                        SizedBox(
                          width: sizeW * 0.2,
                          child: TextFormField(
                            controller: razaosocial,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              icon: Icon(
                                MdiIcons.packageVariant,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 135, 184, 224)),
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
                              labelText: "Estoque Minimo",
                            ),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return "Preencha corretamente!";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: sizeW,
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
                            child: const Text(
                              "Salvar",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {},
                          ),
                        ),
                      ],
                    ),
                  ),
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
