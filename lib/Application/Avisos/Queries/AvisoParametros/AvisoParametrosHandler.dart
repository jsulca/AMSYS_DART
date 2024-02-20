import 'dart:convert';

import 'package:amsys_v3/Application/Avisos/Queries/AvisoParametros/AvisoParametroDto.dart';
import 'package:amsys_v3/Application/Avisos/Queries/AvisoParametros/AvisoParametrosQuery.dart';
import 'package:amsys_v3/Common/AmsysHttpClient.dart';
import 'package:amsys_v3/Common/Result.dart';

class AvisoParametrosHandler {
  Future<Result<AvisoParametroDto>> handle(AvisoParametrosQuery query) async {
    Result<AvisoParametroDto> result = Result();
    try {
      final client = AmsysHttpClient();
      final url = 'https://demo.amsys.com.pe/api/aviso/parametros';

      final response = await client
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        AvisoParametroDto _ = AvisoParametroDto.fromJson(responseData);
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
