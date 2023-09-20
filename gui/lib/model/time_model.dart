class Time {
  int? id;
  String nome;
  String urlEscudo;
  int pontos;

  Time({
    this.id = 0,
    required this.nome,
    required this.urlEscudo,
    required this.pontos,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      id: json['id'],
      nome: json['nome'],
      urlEscudo: json['urlEscudo'],
      pontos: json['pontos'],
    );
  }
}
