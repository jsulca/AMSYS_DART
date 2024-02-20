import 'package:amsys_v3/Application/Avisos/Queries/ListarAvisosPorPagina/ItemAvisoEquipoDto.dart';
import 'package:amsys_v3/Application/Avisos/Queries/ListarAvisosPorPagina/ItemAvisoUbicacionDto.dart';

class ItemAvisoDto {
  int? id;
  String? codigo;
  String? descripcion;
  int? estado;
  ItemAvisoUbicacionDto? ubicacion;
  ItemAvisoEquipoDto? equipo;
  String? registro;
  int? tipo;
  bool? editable;

  ItemAvisoDto(
      {this.id,
      this.codigo,
      this.descripcion,
      this.estado,
      this.ubicacion,
      this.equipo,
      this.registro,
      this.tipo,
      this.editable});

  ItemAvisoDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    descripcion = json['descripcion'];
    estado = json['estado'];
    ubicacion = json['ubicacion'] != null
        ? ItemAvisoUbicacionDto.fromJson(json['ubicacion'])
        : null;
    equipo = json['equipo'] != null
        ? ItemAvisoEquipoDto.fromJson(json['equipo'])
        : null;
    registro = json['registro'];
    tipo = json['tipo'];
    editable = json['editable'];
  }
}
