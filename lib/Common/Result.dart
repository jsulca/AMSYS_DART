import 'dart:convert';

import 'package:http/http.dart';

class Result<T> {
  T? value;
  bool isNotAuthorized = false;
  bool _hasErrors = false;
  List<String>? _errors;

  List<String>? get errors => _errors;

  bool get hasErrors => _hasErrors;

  void addErrors(String responseBody) {
    _hasErrors = true;
    _errors = List<String>.from(jsonDecode(responseBody));
  }

  void addError(String message) {
    _hasErrors = true;
    _errors = [message];
  }

  void addErrorFromHttp(Response response) {
    if (response.statusCode == 400) {
      addErrors(response.body);
    } else if (response.statusCode == 401) {
      isNotAuthorized = true;
    } else {
      addError("Error no controlado");
    }
  }
}
