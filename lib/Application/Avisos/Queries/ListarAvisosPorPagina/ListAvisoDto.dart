import 'package:amsys_v3/Application/Avisos/Queries/ListarAvisosPorPagina/ItemAvisoDto.dart';

class ListAvisoDto {
  List<ItemAvisoDto>? lista;
  int? cantidadPaginas;

  ListAvisoDto({this.lista, this.cantidadPaginas});

  ListAvisoDto.fromJson(Map<String, dynamic> json) {
    if (json['lista'] != null) {
      lista = <ItemAvisoDto>[];
      json['lista'].forEach((v) {
        lista!.add(ItemAvisoDto.fromJson(v));
      });
    }
    cantidadPaginas = json['cantidadPaginas'];
  }
}
