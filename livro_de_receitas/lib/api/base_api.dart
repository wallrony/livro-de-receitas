import 'dart:convert';

import 'package:http/http.dart';

class BaseApi {
  final apiUrl = 'http://192.168.0.105:3333';

  responseToMap(Response response) {
    var mapResponse = json.decode(utf8.decode(response.bodyBytes))['data'];

    return mapResponse;
  }
}
