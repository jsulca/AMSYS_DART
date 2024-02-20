class ListAvisosPorPaginaQuery {
  String? codigo;
  int? pagina;

  ListAvisosPorPaginaQuery({this.codigo, this.pagina});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'codigo': codigo,
      'pagina': pagina,
    };
    return data;
  }
}
