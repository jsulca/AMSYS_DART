class GuardarTemporalDto {
  Map<String, String>? archivos;

  GuardarTemporalDto.fromJson(Map<String, dynamic> json) {
    archivos = json.cast<String, String>();
  }
}
