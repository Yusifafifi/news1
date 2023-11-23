import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=0f8a08d1f7a84dad961fb1bd1c721e21
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi, {
      'apiKey': '0f8a08d1f7a84dad961fb1bd1c721e21',
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
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=0f8a08d1f7a84dad961fb1bd1c721e21
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '0f8a08d1f7a84dad961fb1bd1c721e21',
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
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=0f8a08d1f7a84dad961fb1bd1c721e21
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '0f8a08d1f7a84dad961fb1bd1c721e21',
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
