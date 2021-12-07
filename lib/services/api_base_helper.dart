import 'package:http/http.dart' as http;
import 'package:transcarent_project/models/search_model.dart';

class ApiBase {
  static const String _url = 'serpapi.com';
  static const String _searchString = 'search.json';

  static Future<dynamic> getImages(String searchTerm) async {
    var params = {
      'engine': "google",
      'q': searchTerm,
      'google_domain': "google.com",
      'gl': "us",
      'hl': "en",
      'tbm': "isch",
      'api_key': "389b2be9de5745d3e84951cf6277d1ff05392446c047abdb8caeafccfc713978",
    };

    var url = Uri.https(_url, _searchString, params);
    var result = await http.get(url);
    return searchResultsFromJson(result.body);
  }
}
