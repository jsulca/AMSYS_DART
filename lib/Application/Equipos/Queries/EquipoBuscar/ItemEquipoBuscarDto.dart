class ItemEquipoBuscarDto {
  int? id;
  String? codigo;
  String? nombre;

  ItemEquipoBuscarDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    nombre = json['nombre'];
  }
}
