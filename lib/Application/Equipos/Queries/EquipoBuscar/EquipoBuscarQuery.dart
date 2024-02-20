class EquipoBuscarQuery {
  String? codigo;
  String? nombre;

  EquipoBuscarQuery({this.codigo, this.nombre});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'codigo': codigo,
      'nombre': nombre,
    };
    return data;
  }
}
