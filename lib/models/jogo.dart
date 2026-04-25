class Jogo {
  String id;
  String nome;
  String status;
  int conquistasAtuais;
  int conquistasTotal;
  double nota;
  String dataInicio;
  String dataFim;

  Jogo({
    required this.id,
    required this.nome,
    required this.status,
    required this.conquistasAtuais,
    required this.conquistasTotal,
    required this.nota,
    required this.dataInicio,
    required this.dataFim,
  });
}
