import 'package:http/http.dart' as http;

class FetchData {
  getData(
    String text,
  ) async {
    var url = Uri.parse('http://127.0.0.1:5000/predict');
    var response = await http.post(url, body: {
      'text': text,
    });
    return response.body;
  }
}
