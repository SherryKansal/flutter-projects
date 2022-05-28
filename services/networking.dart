import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  static Future getData() async {
    http.Response resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      String data = resp.body;

      return jsonDecode(data);
    } else {
      print(resp.statusCode);
    }
  }
}