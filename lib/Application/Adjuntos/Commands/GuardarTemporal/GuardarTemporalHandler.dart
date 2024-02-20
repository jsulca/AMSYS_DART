import 'dart:convert';

import 'package:amsys_v3/Application/Adjuntos/Commands/GuardarTemporal/GuardarTemporalCommand.dart';
import 'package:amsys_v3/Application/Adjuntos/Commands/GuardarTemporal/GuardarTemporalDto.dart';
import 'package:amsys_v3/Common/AmsysHttpClient.dart';
import 'package:amsys_v3/Common/Result.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class GuardarTemporalHandler {
  Future<Result<GuardarTemporalDto>> handle(
      GuardarTemporalCommand command) async {
    Result<GuardarTemporalDto> result = Result();

    final client = AmsysHttpClient();
    final url = 'https://demo.amsys.com.pe/api/adjunto/guardartemporales';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    try {
      File file;
      for (String archivo in command.archivos!) {
        file = File(archivo);
        if (await file.exists()) {
          request.files
              .add(await http.MultipartFile.fromPath('archivos', file.path));
        }
      }

      // request.headers['Content-Type'] = 'multipart/form-data';

      var response = await client.sendMultipartRequest(request);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        GuardarTemporalDto _ = GuardarTemporalDto.fromJson(responseData);
        result.value = _;
      } else {
        result.addErrorFromHttp(response);
      }
    } catch (e) {
      result.addError("$e");
    }

    return result;
  }
}
