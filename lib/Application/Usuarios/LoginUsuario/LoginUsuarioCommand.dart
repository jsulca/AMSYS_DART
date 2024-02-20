class LoginUsuarioCommand {
  String? correo;
  String? clave;

  LoginUsuarioCommand({this.correo, this.clave});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'correo': correo,
      'clave': clave
    };
    return data;
  }
}
