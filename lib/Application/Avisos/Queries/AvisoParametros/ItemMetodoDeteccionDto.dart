class ItemMetodoDeteccionDto {
  int? id;
  String? nombre;

  ItemMetodoDeteccionDto({this.id, this.nombre});

  ItemMetodoDeteccionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
  }
}
