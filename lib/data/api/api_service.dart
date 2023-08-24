import 'package:http/http.dart' as http;
import 'api.dart';

class ApiService {
  //api requets for GET
  static Future<dynamic>? getApiRequest(
      {String baseUrl = ApiConstants.baseUrl,
      String? apiEndPoint = "",
      Function? responseParser}) async {
    final response = await http.get(Uri.parse(baseUrl + apiEndPoint!));

    debugPrint("Base URL ${baseUrl + apiEndPoint}");

    if (response.statusCode == 200) {
      if (responseParser != null) {
        return responseParser(jsonDecode(response.body));
      }
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
