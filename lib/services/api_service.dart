import 'dart:convert';
import 'package:http/http.dart';

class ApiService {

  String catDetails = "https://api.thecatapi.com/v1/breeds";

  Future<List<String>> getCatBreedNames() async {
    try {
      Response response = await get(Uri.parse(catDetails));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        List<String> breedNames = [];

        for (dynamic item in body) {
          String breedName = item['name'] ?? '';
          breedNames.add(breedName);
        }

        return breedNames;
      } else {
        throw Exception('Failed to load cat breed names');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }






}