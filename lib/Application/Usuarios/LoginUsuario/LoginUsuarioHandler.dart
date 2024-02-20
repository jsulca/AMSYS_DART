import 'dart:async';
import 'dart:convert';
import 'package:amsys_v3/Common/Result.dart';
import 'package:amsys_v3/Application/Usuarios/LoginUsuario/LoginUsuarioCommand.dart';
import 'package:amsys_v3/Application/Usuarios/LoginUsuario/LoginUsuarioDto.dart';
import 'package:http/http.dart' as http;

class LoginUsuarioHandler {
  Future<Result<LoginUsuarioDto>> handle(LoginUsuarioCommand command) async {
    Result<LoginUsuarioDto> result = Result<LoginUsuarioDto>();
    try {
      final response = await http.post(
        Uri.parse('https://demo.amsys.com.pe/api/Usuario'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(command.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        LoginUsuarioDto _ = LoginUsuarioDto.fromJson(responseData);
        result.value = _;
      } else {
        result.addErrors(response.body);
      }
    } catch (e) {
      result.addError('$e');
    }

    return result;
  }
}
