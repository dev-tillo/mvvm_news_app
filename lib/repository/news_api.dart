import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:restapi/model/articel_model.dart';
import 'abstract_class_repository.dart';
import 'package:restapi/model/articles_list_model.dart';

class NewsApi extends ClassRepository {
  // put the API key here
  var keyApi = "023eab991fa74b7588d7c3620f65c08f";

  @override
  Future<List<ArticleModel>> getAllNews() async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&apiKey=$keyApi");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        // here shacked number status code
        print("status code#Amer# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("here Amer Exception code staus");
  }

  @override
  Future<List<ArticleModel>> getCategory(String category) async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$keyApi");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        // here shacked number status code
        // ignore: avoid_print
        print("status code#Amer# = ${response.statusCode}");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    throw Exception("here Amer Exception code status");
  }
}
