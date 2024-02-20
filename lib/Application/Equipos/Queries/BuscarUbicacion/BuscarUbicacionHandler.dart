import 'dart:convert';

import 'package:amsys_v3/Common/AmsysHttpClient.dart';
import 'package:amsys_v3/Common/EncodeUri.dart';
import 'package:amsys_v3/Common/Result.dart';
import 'package:amsys_v3/Application/Equipos/Queries/BuscarUbicacion/BuscarUbicacionQuery.dart';
import 'package:amsys_v3/Application/Equipos/Queries/BuscarUbicacion/ItemUbicacionDto.dart';

class BuscarUbicacionHandler {
  Future<Result<ItemUbicacionDto>> handle(BuscarUbicacionQuery query) async {
    Result<ItemUbicacionDto> result = Result();

    try {
      final client = AmsysHttpClient();
      final url =
          'https://demo.amsys.com.pe/api/equipo/buscarubicacion?${EncodeUri.encodeWithNotNulls(query.toJson())}';

      final response = await client
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        ItemUbicacionDto _ = ItemUbicacionDto.fromJson(responseData);
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
