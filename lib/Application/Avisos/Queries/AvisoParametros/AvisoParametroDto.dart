import 'package:amsys_v3/Application/Avisos/Queries/AvisoParametros/ItemMetodoDeteccionDto.dart';
import 'package:amsys_v3/Application/Avisos/Queries/AvisoParametros/ItemPrioridadDto.dart';

class AvisoParametroDto {
  List<ItemPrioridadDto>? prioridades;
  List<ItemMetodoDeteccionDto>? metodosDeteccion;

  AvisoParametroDto.fromJson(Map<String, dynamic> json) {
    if (json['prioridades'] != null) {
      prioridades = <ItemPrioridadDto>[];
      json['prioridades'].forEach((v) {
        prioridades!.add(ItemPrioridadDto.fromJson(v));
      });
    }
    if (json['metodosDeteccion'] != null) {
      metodosDeteccion = <ItemMetodoDeteccionDto>[];
      json['metodosDeteccion'].forEach((v) {
        metodosDeteccion!.add(ItemMetodoDeteccionDto.fromJson(v));
      });
    }
  }
}
