class BuscarUbicacionQuery {
  int? id;

  BuscarUbicacionQuery({this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
    };
    return data;
  }
}
