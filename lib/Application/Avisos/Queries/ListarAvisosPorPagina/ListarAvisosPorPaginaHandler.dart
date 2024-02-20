import 'package:amsys_v3/Application/Avisos/Queries/ListarAvisosPorPagina/ListAvisoDto.dart';
import 'package:amsys_v3/Application/Avisos/Queries/ListarAvisosPorPagina/ListAvisosPorPaginaQuery.dart';
import 'package:amsys_v3/Common/AmsysHttpClient.dart';
import 'package:amsys_v3/Common/EncodeUri.dart';
import 'dart:convert';

import 'package:amsys_v3/Common/Result.dart';

class ListarAvisosPorPaginaHandler {
  Future<Result<ListAvisoDto>> handle(ListAvisosPorPaginaQuery query) async {
    Result<ListAvisoDto> result = Result();
    try {
      final client = AmsysHttpClient();
      final url =
          'https://demo.amsys.com.pe/api/aviso/listar?${EncodeUri.encodeWithNotNulls(query.toJson())}';

      final response = await client
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        ListAvisoDto _ = ListAvisoDto.fromJson(responseData);
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
