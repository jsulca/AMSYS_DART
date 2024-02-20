class LoginUsuarioDto {
  String? nombre;
  String? correo;
  String? token;

  LoginUsuarioDto({this.nombre, this.correo, this.token});

  LoginUsuarioDto.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    correo = json['correo'];
    token = json['token'];
  }
}
