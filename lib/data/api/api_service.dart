import 'dart:io';
import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class ApiService {
  
  static Future<ApiResponse<T>> getApiHelper<T>({String baseUrl = ApiConstants.baseUrl,String? apiEndPoint,Function? responseParser}) async {
  try {
    final response = await http.get(Uri.parse(baseUrl + apiEndPoint!));
     debugPrint("Base URL ${baseUrl + apiEndPoint}");
      debugPrint("Response ${response.body}");
   
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (responseParser != null) {
        return Success(responseParser(jsonDecode(response.body)));
      } else {
        return ServerError("Error");
      }
    } else {
      return ServerError("Error");
    }
  } catch (exception) {
    if (exception is SocketException) {
      return NoInternetConnection("No Internet Connection");
    } else {
      return ServerError("Unexpected internal server error.");
    }
  }
}
}
