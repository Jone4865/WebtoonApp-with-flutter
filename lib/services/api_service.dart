import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_prac/modules/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(
        (response.body),
      );
      for (var webtoon in webtoons) {
        webtoonInstances.add(
          WebtoonModel.fromJson(webtoon),
        );
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }
}


  // List<WebtoonModel> webtoons = [];
  // bool isLoading = true;

  // void waitForWebToons() async {
  //   webtoons = await ApiService.getTodaysToons();
  //   isLoading = false;
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   waitForWebToons();
  // }