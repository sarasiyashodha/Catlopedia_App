import 'dart:convert';
import 'package:http/http.dart';

class ApiService {

  String catDetails = "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&";
  String apiKey = "api_key=live_uwlmDqZYA9CWwBJzIUHk6xAdMzKUX4xAFo5hHkkI0cekWj5HFYLkbwKmsZvjZXr0";

  Future<void> getCatDetails() async{
    Response response = await get(Uri.parse("$catDetails$apiKey"));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
   
    } else {

    }

  }


}