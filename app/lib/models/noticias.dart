import 'dart:convert';
class Noticia {
    Noticia({
        required this.titulo,
        required this.desarrollo,
    });
    
    String titulo;
    String desarrollo;
    String? id;

    factory Noticia.fromJson(String str) => Noticia.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Noticia.fromMap(Map<String, dynamic> json) => Noticia(
        titulo: json["titulo"],
        desarrollo: json["desarrollo"],
    );

    Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "desarrollo": desarrollo,
    };

    Noticia copy() => Noticia(
      titulo: this.titulo,
      desarrollo: this.desarrollo,
    );

  Noticia Copy() => Noticia(
      titulo: this.titulo,
      desarrollo: this.desarrollo,
    );
}
