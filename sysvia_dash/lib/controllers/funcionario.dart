class Funcionarios {
  final String nome;
  final String cargo;
  final String empresa;
  final String referencia;

  const Funcionarios({
    required this.nome,
    required this.cargo,
    required this.empresa,
    required this.referencia,
  });

  factory Funcionarios.fromMap(Map<dynamic, dynamic> map) {
    return Funcionarios(
        nome: map['nome'] ?? '',
        cargo: map['cargo'] ?? '',
        empresa: map['empresa'] ?? '',
        referencia: map['referencia'] ?? '');
  }
}
