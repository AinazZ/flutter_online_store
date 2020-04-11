import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseApi {
  String apiServer = "http://ostest.whitetigersoft.ru/api/";
  String apiKey = "phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF";

  getApiUrl(String relativePath, int categoryId) {
    if (categoryId != null) {
      var apiUrl = apiServer + relativePath + "?appKey=" + apiKey + "&categoryId=" + categoryId.toString();

      return apiUrl;
    } else {
      var apiUrl = apiServer + relativePath + "?appKey=" + apiKey;

      return apiUrl;
    }
  }

  Future<dynamic> get(String relativePath, int categoryId) async {
    var apiUrl = getApiUrl(relativePath, categoryId);

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Failed to load items');
    }
  }
}