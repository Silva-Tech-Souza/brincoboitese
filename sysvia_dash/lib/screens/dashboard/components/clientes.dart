import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  Color txtfreleaspre = Color.fromARGB(255, 0, 94, 138),
      txtfreleassou = Color.fromARGB(255, 255, 255, 255);
  Color colorsou = Color.fromARGB(255, 19, 102, 105),
      colorpreciso = const Color.fromARGB(255, 193, 246, 248);

  Color txtfreleaspre1 = Color.fromARGB(255, 0, 94, 138),
      txtfreleassou1 = Color.fromARGB(255, 255, 255, 255);
  Color colorsou1 = Color.fromARGB(255, 19, 102, 105),
      colorpreciso1 = const Color.fromARGB(255, 193, 246, 248);
  bool pessoa = true;
  int? numeroCliente;
  var maskFormatcpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r"[0-9]")},
    type: MaskAutoCompletionType.lazy,
  );
  var maskFormatrg = MaskTextInputFormatter(
    mask: '##.###.###-#',
    filter: {"#": RegExp(r"[0-9]")},
    type: MaskAutoCompletionType.lazy,
  );
  var maskFormatcelular = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r"[0-9]")},
    type: MaskAutoCompletionType.lazy,
  );
  var maskFormatcnpj = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {"#": RegExp(r"[0-9]")},
    type: MaskAutoCompletionType.lazy,
  );
  List<List<String>> tipoempresa = [
    ["Bom Retiro", " Brás"]
  ];
  final _formKey = GlobalKey<FormState>(debugLabel: '_CadastroEmpresaState');
  TextEditingController nome = TextEditingController();
  TextEditingController razaosocial = TextEditingController();
  TextEditingController rg = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController inscrEstadu = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController celular = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

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

  String empresa = "bom retiro";
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
      child: SingleChildScrollView(
        child: !cadclientes
            ? StreamBuilder<QuerySnapshot>(
                stream: db.collection("Clientes").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length == null ||
                        snapshot.data!.docs.length == "") {
                      numeroCliente = 0;
                    } else {
                      numeroCliente = snapshot.data!.docs.length + 1;
                    }
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
                                        "Clientes",
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                          color:
                                              Color.fromARGB(255, 31, 31, 31),
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
                                            color: Color.fromARGB(
                                                255, 29, 29, 29)),
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          defaultPadding / 2),
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
                                          cadclientes = true;
                                          cadinsumo = false;
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
                                          color: Color.fromARGB(
                                              212, 182, 182, 182),
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Nome/Razão Social',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              212, 182, 182, 182),
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Celular',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              212, 182, 182, 182),
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Email',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              212, 182, 182, 182),
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Endereço',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              212, 182, 182, 182),
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
                                          color: Color.fromARGB(
                                              212, 182, 182, 182),
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
                                        "Clientes",
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                          color:
                                              Color.fromARGB(255, 31, 31, 31),
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
                                            color: Color.fromARGB(
                                                255, 29, 29, 29)),
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          defaultPadding / 2),
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
                                          cadclientes = true;
                                          cadinsumo = false;
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
                            "Cadastrar Clientes",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
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
                                  txtfreleaspre =
                                      Color.fromARGB(255, 0, 94, 138);
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
                                  txtfreleassou =
                                      Color.fromARGB(255, 0, 94, 138);
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
                    Container(
                      child: Text(
                        "Escolha o local:",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: sizeW * 0.10,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colorsou1,
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
                                style: TextStyle(color: txtfreleassou1),
                              ),
                              onPressed: () {
                                setState(() {
                                  empresa = "bom retiro";
                                  colorpreciso1 =
                                      const Color.fromARGB(255, 193, 246, 248);
                                  txtfreleassou1 =
                                      Color.fromARGB(255, 255, 255, 255);
                                  txtfreleaspre1 =
                                      Color.fromARGB(255, 0, 94, 138);
                                  colorsou1 = Color.fromARGB(255, 19, 102, 105);
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: sizeW * 0.10,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colorpreciso1,
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
                                style: TextStyle(color: txtfreleaspre1),
                              ),
                              onPressed: () {
                                setState(() {
                                  empresa = "bras";
                                  txtfreleaspre1 =
                                      Color.fromARGB(255, 255, 255, 255);
                                  txtfreleassou1 =
                                      Color.fromARGB(255, 0, 94, 138);
                                  colorsou1 =
                                      const Color.fromARGB(255, 193, 246, 248);
                                  colorpreciso1 =
                                      Color.fromARGB(255, 19, 102, 105);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: sizeW * 0.25,
                      // height: sizeW * 0.17,
                      child: TextFormField(
                        initialValue: numeroCliente.toString(),
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
                                width: 2,
                                color: Color.fromARGB(255, 1, 97, 207)),
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
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
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
                                  controller: razaosocial,
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
                                    labelText: "Razão Social",
                                  ),
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
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
                                  controller: cnpj,
                                  keyboardType: TextInputType.number,
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
                                    labelText: "CNPJ",
                                  ),
                                  inputFormatters: [maskFormatcnpj],
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                    if (CNPJValidator.isValid(
                                        value.toString())) {
                                      return null;
                                    } else {
                                      return 'CNPJ não confere.';
                                    }
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
                                  controller: celular,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
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
                                    labelText: "Celular",
                                  ),
                                  inputFormatters: [maskFormatcelular],
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW * 0.32,
                                //   height: sizeW * 0.17,
                                child: TextFormField(
                                  maxLength: 15,
                                  controller: inscrEstadu,
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
                                    labelText: "Inscrição Estadual",
                                  ),
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW + 0.9,
                                child: TextFormField(
                                  controller: endereco,
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
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW * 0.8,
                                child: TextFormField(
                                  controller: email,
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
                                ),
                              ),
                              const SizedBox(
                                height: 6,
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
                                        child: const Text(
                                          "Salvar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('Clientes')
                                              .doc(numeroCliente.toString())
                                              .set({
                                                'id': numeroCliente.toString(),
                                                'pessoajuridica':
                                                    pessoa.toString(),
                                                'nome': nome.text.toString(),
                                                'razaosocial':
                                                    razaosocial.text.toString(),
                                                'rg': rg.text.toString(),
                                                'cpf': cpf.text.toString(),
                                                'cnpj': cnpj.text.toString(),
                                                'endereco':
                                                    endereco.text.toString(),
                                                'empresa': empresa.toString(),
                                                "inscrEstadu":
                                                    inscrEstadu.text.toString(),
                                                "celular":
                                                    celular.text.toString(),
                                              })
                                              .then((value) =>
                                                  print("Cliente Added"))
                                              .catchError((error) => print(
                                                  "Failed to add cliente: $error"));
                                          setState(() {
                                            funionario = false;
                                            clientes = true;
                                            insumo = false;

                                            cadclientes = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                  controller: nome,
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
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
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
                                  controller: cpf,
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
                                  inputFormatters: [maskFormatcpf],
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                    if (CPFValidator.isValid(
                                        value.toString())) {
                                      return null;
                                    } else {
                                      return 'CPF não confere.';
                                    }
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
                                  controller: celular,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
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
                                    labelText: "Celular",
                                  ),
                                  inputFormatters: [maskFormatcelular],
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW * 0.32,
                                //   height: sizeW * 0.17,
                                child: TextFormField(
                                  maxLength: 15,
                                  controller: rg,
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
                                  inputFormatters: [maskFormatrg],
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return "Preencha corretamente!";
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: sizeW + 0.9,
                                child: TextFormField(
                                  controller: endereco,
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
                                  controller: email,
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
                                        child: const Text(
                                          "Salvar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('Clientes')
                                              .doc(empresa.toString())
                                              .collection("clireferencia")
                                              .doc(numeroCliente.toString())
                                              .set({
                                                'id': numeroCliente.toString(),
                                                'pessoajuridica':
                                                    pessoa.toString(),
                                                'nome': nome.text.toString(),
                                                'razaosocial':
                                                    razaosocial.text.toString(),
                                                'rg': rg.text.toString(),
                                                'cpf': cpf.text.toString(),
                                                'empresa': empresa.toString(),
                                                'cnpj': cnpj.text.toString(),
                                                'endereco':
                                                    endereco.text.toString(),
                                                "inscrEstadu":
                                                    inscrEstadu.text.toString(),
                                                "celular":
                                                    celular.text.toString(),
                                              })
                                              .then((value) =>
                                                  print("Cliente Added"))
                                              .catchError((error) => print(
                                                  "Failed to add cliente: $error"));
                                          setState(() {
                                            funionario = false;
                                            clientes = true;
                                            insumo = false;
                                            cadclientes = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
