import 'package:amsys_v3/Services/AuthTokenService.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class AmsysHttpClient extends http.BaseClient {
  final GetIt getIt = GetIt.I;
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    AuthTokenService authTokenService = getIt<AuthTokenService>();

    String? token = authTokenService.token;
    if (token != null) request.headers['Authorization'] = 'Bearer $token';
    return _inner.send(request);
  }

  Future<http.Response> sendMultipartRequest(
      http.MultipartRequest request) async {
    AuthTokenService authTokenService = getIt<AuthTokenService>();
    
    String? token = authTokenService.token;
    if (token != null) request.headers['Authorization'] = 'Bearer $token';
    return http.Response.fromStream(await _inner.send(request));
  }
}
