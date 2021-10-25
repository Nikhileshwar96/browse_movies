import '../abstracts/api_repository.dart';
import 'package:http/http.dart' as http;

class HttpRepository extends APIRepository {
  @override
  Future<String> get(String uri, String apikeyQuery) async {
    var response = await http.get(Uri.parse('$uri&$apikeyQuery'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> post(
      String uri, String requestBody, String apikeyQuery) async {
    var response = await http.post(
      Uri.parse('$uri&$apikeyQuery'),
      body: requestBody,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }
}

class RequestData {
  String status = '';
  String exceptionData = '';
  bool isSuccess = true;
}
