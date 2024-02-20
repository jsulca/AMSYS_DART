class ItemPrioridadDto {
  int? id;
  String? descripcion;

  ItemPrioridadDto({this.id, this.descripcion});

  ItemPrioridadDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripcion'];
  }
}