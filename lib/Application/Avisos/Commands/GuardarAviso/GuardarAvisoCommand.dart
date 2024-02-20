class GuardarAvisoCommand {
  int? tipo;
  int? ubicacionId;
  int? equipoId;
  String? descripcion;
  String? comentario;
  int? prioridadId;
  int? metodoDeteccionId;
  bool tieneParada = false;
  DateTime? inicioParada;
  DateTime? finParada;
  DateTime? fechaEvento;
  Map<String, String>? archivos;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'tipo': tipo,
      'ubicacionId': ubicacionId,
      'equipoId': equipoId,
      'descripcion': descripcion,
      'comentario': comentario,
      'prioridadId': prioridadId,
      'metodoDeteccionId': metodoDeteccionId,
      'tieneParada': tieneParada,
      'inicioParada': inicioParada,
      'finParada': finParada,
      'fechaEvento': fechaEvento,
      'archivos': archivos
    };
    return data;
  }
}
