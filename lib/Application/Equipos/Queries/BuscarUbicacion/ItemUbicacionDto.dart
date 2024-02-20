class ItemUbicacionDto {
  int? id;
  String? codigo;
  String? nombre;
  bool? estaMontado;

  ItemUbicacionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    nombre = json['nombre'];
    estaMontado = json['estaMontado'];
  }
}
