class ItemAvisoEquipoDto {
  String? codigo;
  String? nombre;

  ItemAvisoEquipoDto({this.codigo, this.nombre});

  ItemAvisoEquipoDto.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nombre = json['nombre'];
  }
}
