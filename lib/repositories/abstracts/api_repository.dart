abstract class APIRepository {
  Future<String> get(String uri, String apikeyQuery);
  Future<String> post(String uri, String requestBody, String apikeyQuery);
}
