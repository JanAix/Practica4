class Nota {
  final String titulo;
  final String contenido;

  Nota({required this.titulo, required this.contenido});

  // Convertir Nota a JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'contenido': contenido,
    };
  }

  // Crear Nota desde JSON
  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      titulo: json['titulo'],
      contenido: json['contenido'],
    );
  }
}
