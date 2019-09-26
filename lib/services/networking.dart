import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    try {
      http.Response response = await http.get(url);
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }

    catch (e){
      print(e);
    }
  }

}