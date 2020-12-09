import 'package:http/http.dart' as http;
import 'package:virtual_learning/utils/url.dart';

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body});

  Future<http.Response> post() {
    return http.post(baseUrl + url, body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    return http.get(baseUrl + url).timeout(Duration(minutes: 2));
  }

  Future<http.Response> delete() {
    return http.delete(baseUrl + url).timeout(Duration(minutes: 2));
  }
}
