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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Funcionários",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
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
                                const Text(
                                  "Funcionários",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
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
                              height: 50,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
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
                              height: 50,
                              width: sizeW * 0.30,
                              margin: const EdgeInsets.all(6),
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
                  ],
                ),
              ),
      ),
    );
  }
}
