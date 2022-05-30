class Funcionarios {
  final String nome;
  final String cargo;
  final String referencia;

  const Funcionarios({
    required this.nome,
    required this.cargo,
    required this.referencia,
  });

  factory Funcionarios.fromMap(Map<dynamic, dynamic> map) {
    return Funcionarios(
        nome: map['nome'] ?? '',
        cargo: map['cargo'] ?? '',
        referencia: map['referencia'] ?? '');
  }
}
