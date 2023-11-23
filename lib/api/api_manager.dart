import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=510b871a954849cebad6b3672d5804a5
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi, {
      'apiKey': '510b871a954849cebad6b3672d5804a5',
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=510b871a954849cebad6b3672d5804a5
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '510b871a954849cebad6b3672d5804a5',
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> searchNews(String query) async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=510b871a954849cebad6b3672d5804a5
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '510b871a954849cebad6b3672d5804a5',
      'q': query,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
