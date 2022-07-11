import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/rightSide.dart';

class Users {
  String id;
  Users({
    required this.id,
  });
  String nome = "";
  String referencia = "";
  String empresa = "";
  String cargo = "master";
  Future<void> limpar() async {
    nome = "";
    referencia = "";
    id = "";
    cargo = "";
    empresa = "";
  }

  Future<void> loadUser() async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("Users").child(id.toString());

    // print(ref.toString());
    final snapshot = await ref.get();

    if (snapshot.exists) {
      empresa = snapshot.child("empresa").value.toString();
      nome = snapshot.child("nome").value.toString();
      referencia = snapshot.child("referencia").value.toString();
      cargo = snapshot.child("cargo").value.toString();
    }
    if (empresa.toString() != empresafilieal.toString() &&
        empresafilieal.isNotEmpty &&
        empresafilieal.toString().toString() != "") {
      updateFuncionarioEMPRESA();
    }
  }

  Future<void> updateFuncionarioEMPRESA() async {
    try {
      id = FirebaseAuth.instance.currentUser?.uid ?? "";
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Users").child(id.toString());
      var users = FirebaseAuth.instance.currentUser;
      await users!.sendEmailVerification();
      await ref.update({
        'empresa': empresafilieal,
      }).then((value) => null /*segurar a execução até a task ser terminada*/);
    } on FirebaseAuthException catch (e) {
      debugPrint('erro: ${e}');
    }
  }

  Future<void> registerAccount(
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      id = FirebaseAuth.instance.currentUser?.uid ?? "";
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Users").child(id.toString());
      var users = FirebaseAuth.instance.currentUser;
      await users!.sendEmailVerification();
      await ref.set({
        'id': id,
        'nome': nome,
        'referencia': referencia,
        'empresa': empresa,
        'cargo': cargo,
      }).then((value) => null /*segurar a execução até a task ser terminada*/);
    } on FirebaseAuthException catch (e) {
      debugPrint('erro: ${e}');
      errorCallback(e);
    }
  }
}
