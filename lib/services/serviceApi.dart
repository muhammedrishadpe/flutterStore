import 'package:flutterstore/model/postModel.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPost() async {
    var client = http.Client();

    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
