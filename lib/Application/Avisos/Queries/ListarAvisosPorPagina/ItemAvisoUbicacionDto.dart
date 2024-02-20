class ItemAvisoUbicacionDto {
  String? codigo;
  String? nombre;

  ItemAvisoUbicacionDto({this.codigo, this.nombre});

  ItemAvisoUbicacionDto.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nombre = json['nombre'];
  }
}
