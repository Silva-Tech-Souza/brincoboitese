import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../../../widgets/constants.dart';
import '../dashboard_screen.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({Key? key}) : super(key: key);

  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  final db = FirebaseFirestore.instance;
  var dbfilter;

  final _formKey = GlobalKey<FormState>(debugLabel: '_RecentFilesState');

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

  List<List<String>> tipoempresa = [
    ["Bom Retiro", " Brás"]
  ];
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
        child: !cadfunionario
            ? StreamBuilder<QuerySnapshot>(
                stream: db.collection("Funcionarios").snapshots(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Funcionário",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
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
                                              color: Color.fromARGB(
                                                  255, 31, 31, 31),
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          e.toString(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      46,
                                                                      46,
                                                                      46),
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                              floatingLabelStyle:
                                                  const TextStyle(
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
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          defaultPadding / 2),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 130, 51, 233),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
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
                                              cadfunionario = true;
                                              cadclientes = false;
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
                                  ])),
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
                                      'Nome',
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
                                      'Status',
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Funcionário",
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
                                          color:
                                              Color.fromARGB(255, 31, 31, 31)),
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
                                        decorationColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        color: Color.fromARGB(255, 29, 29, 29)),
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(220, 97, 97, 97)),
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
                                      cadfunionario = true;
                                      cadclientes = false;
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
                          ]),
                    );
                  }
                })
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
                                cadfunionario = false;
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
                            "Cadastrar Funcionário",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
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
                      height: 6,
                    ),
                    SizedBox(
                      width: sizeW,
                      //    height: sizeW * 0.16,
                      child: TextFormField(
                        maxLength: 80,
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
                          labelText: "Nome",
                        ),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return "Preencha corretamente!";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: sizeW,
                      //    height: sizeW * 0.16,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "CGC/CPF",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "IE/RG",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: sizeW,
                      //    height: sizeW * 0.16,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "Departamento",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "Data Cadastro",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: sizeW * 0.5,
                      //    height: sizeW * 0.16,
                      child: TextFormField(
                        maxLength: 80,
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
                          labelText: "Saldo",
                        ),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return "Preencha corretamente!";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: sizeW * 0.5,
                      //    height: sizeW * 0.16,
                      child: TextFormField(
                        maxLength: 80,
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
                          labelText: "CEP",
                        ),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return "Preencha corretamente!";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: sizeW * 0.5,
                      //    height: sizeW * 0.16,
                      child: TextFormField(
                        maxLength: 80,
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
                          labelText: "Endereço",
                        ),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return "Preencha corretamente!";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: sizeW,
                      //    height: sizeW * 0.16,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "Número",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "Comple",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: sizeW,
                      //    height: sizeW * 0.16,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "Bairro",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 70,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
                              child: TextFormField(
                                maxLength: 80,
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
                                  labelText: "Cidade",
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return "Preencha corretamente!";
                                  }
                                },
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
