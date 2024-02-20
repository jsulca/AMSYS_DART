import 'dart:convert';

import 'package:amsys_v3/Common/AmsysHttpClient.dart';
import 'package:amsys_v3/Common/EncodeUri.dart';
import 'package:amsys_v3/Common/Result.dart';
import 'package:amsys_v3/Application/Equipos/Queries/EquipoBuscar/EquipoBuscarQuery.dart';
import 'package:amsys_v3/Application/Equipos/Queries/EquipoBuscar/ItemEquipoBuscarDto.dart';

class EquipoBuscarHandler {
  Future<Result<List<ItemEquipoBuscarDto>>> handle(
      EquipoBuscarQuery query) async {
    Result<List<ItemEquipoBuscarDto>> result = Result();

    try {
      final client = AmsysHttpClient();
      final url =
          'https://demo.amsys.com.pe/api/equipo/listar?${EncodeUri.encodeWithNotNulls(query.toJson())}';

      final response = await client
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> listaMaps =
            List<Map<String, dynamic>>.from(jsonDecode(response.body));

        List<ItemEquipoBuscarDto> _ =
            listaMaps.map((x) => ItemEquipoBuscarDto.fromJson(x)).toList();
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
