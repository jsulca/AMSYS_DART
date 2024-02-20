import 'package:amsys_v3/Application/Adjuntos/Commands/GuardarTemporal/GuardarTemporalCommand.dart';
import 'package:amsys_v3/Application/Adjuntos/Commands/GuardarTemporal/GuardarTemporalDto.dart';
import 'package:amsys_v3/Application/Adjuntos/Commands/GuardarTemporal/GuardarTemporalHandler.dart';
import 'package:amsys_v3/Common/Result.dart';
import 'package:amsys_v3/Services/AuthTokenService.dart';
import 'package:amsys_v3/Application/Usuarios/LoginUsuario/LoginUsuarioCommand.dart';
import 'package:amsys_v3/Application/Usuarios/LoginUsuario/LoginUsuarioDto.dart';
import 'package:amsys_v3/Application/Usuarios/LoginUsuario/LoginUsuarioHandler.dart';
import 'package:get_it/get_it.dart';

import 'DependecyInjection.dart';

void main(List<String> arguments) async {
  DependecyInjections dependecyInjections = DependecyInjections();
  dependecyInjections.setup();

  final GetIt getIt = GetIt.I;
  LoginUsuarioHandler loginUsuarioHandler = getIt<LoginUsuarioHandler>();

  LoginUsuarioCommand command = LoginUsuarioCommand(
      correo: "administrador@alphamanufacturas.com", clave: "123");

  Result<LoginUsuarioDto> _ = await loginUsuarioHandler.handle(command);

  if (_.hasErrors) {
    print('Ocurrió un error al momento de autenticar');
    return;
  }

  LoginUsuarioDto login = _.value!;

  AuthTokenService authTokenService = getIt<AuthTokenService>();
  authTokenService.token = login.token;

  print('Nombre: ${login.nombre}');
  print('Correo: ${login.correo}');
  print('Token: ${login.token}');

  GuardarTemporalHandler guardarTemporalHandle = getIt();
  GuardarTemporalCommand guardarTemporalCommand = GuardarTemporalCommand();
  guardarTemporalCommand.archivos = [
    'C:\\Users\\junior\\Downloads\\ImagenWsp.jpg',
    'C:\\Users\\junior\\Downloads\\image.png',
    'C:\\Users\\junior\\Downloads\\LA5442246MTQH-3a6a3218-1c2c-404b-87ce-8d04e8b2c5f7-cuv.pdf'
  ];

  Result<GuardarTemporalDto> resultado =
      await guardarTemporalHandle.handle(guardarTemporalCommand);

  print('Ocurrio errores: ${resultado.hasErrors ? 'Si' : 'No'}');

  GuardarTemporalDto valor = resultado.value!;

  valor.archivos!.forEach((key, value) {
    print('$key: $value');
  });
}
