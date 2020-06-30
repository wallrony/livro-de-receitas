import 'dart:convert';

import 'package:http/http.dart';

class BaseApi {
  final apiUrl = 'http://localhost:3333';

  responseToMap(Response response) {
    var mapResponse = json.decode(utf8.decode(response.bodyBytes));

    return mapResponse;
  }
}
