import 'package:amsys_v3/Application/Adjuntos/Commands/GuardarTemporal/GuardarTemporalHandler.dart';
import 'package:amsys_v3/Application/Avisos/Queries/AvisoParametros/AvisoParametrosHandler.dart';
import 'package:amsys_v3/Application/Avisos/Queries/ListarAvisosPorPagina/ListarAvisosPorPaginaHandler.dart';
import 'package:amsys_v3/Application/Equipos/Queries/BuscarUbicacion/BuscarUbicacionHandler.dart';
import 'package:amsys_v3/Application/Equipos/Queries/EquipoBuscar/EquipoBuscarHandler.dart';
import 'package:amsys_v3/Services/AuthTokenService.dart';
import 'package:amsys_v3/Application/Usuarios/LoginUsuario/LoginUsuarioHandler.dart';
import 'package:get_it/get_it.dart';

class DependecyInjections {
  final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton(() => LoginUsuarioHandler());
    getIt.registerLazySingleton(() => ListarAvisosPorPaginaHandler());
    getIt.registerLazySingleton(() => AvisoParametrosHandler());
    getIt.registerLazySingleton(() => EquipoBuscarHandler());
    getIt.registerLazySingleton(() => BuscarUbicacionHandler());
    getIt.registerLazySingleton(() => GuardarTemporalHandler());

    getIt.registerLazySingleton(() => AuthTokenService());
  }
}
