import 'dart:convert';

import 'package:http/http.dart';
import 'package:mini_project_2/models/news.dart';

class NewsServices {
  Future<List<NewsModel>> getNews(String search) async {
    String baseUrl = "https://newsapi.org/v2/everything";

    Map<String, String> queryParams = {
      'q': search,
      // 'from': '2024-01-27',
      // 'to': '2024-01-27',
      'sortBy': 'popularity',
      'apiKey': '20a2be796d574dfba59c911cc3eb13a3',
    };
    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = '$baseUrl?$queryString';

    Response response = await get(Uri.parse(apiUrl));
    try{
      final List result = jsonDecode(response.body)['articles'];
      return result.map((e) => NewsModel.fromJson(e)).toList();
    }
    catch(e){
      throw Exception('Failed to load news: ${response.reasonPhrase}\nError: ${e.toString()}');
    }
  }
}