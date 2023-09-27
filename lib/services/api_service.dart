import 'dart:convert';
import 'package:http/http.dart';

class ApiService {

  String catDetails = "https://api.thecatapi.com/v1/breeds";
  String catImages = "https://api.thecatapi.com/v1/images/0XYvRd7oD";


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

  // Future<String> fetchCatReferenceImageID(String breedName) async {
  //   Response response2 = await get(
  //     Uri.parse(catDetails),
  //   );
  //
  //   if (response2.statusCode == 200) {
  //     List<dynamic> body = json.decode(response2.body);
  //     String referenceImageID = body["reference_image_id"];
  //     return referenceImageID;
  //   } else {
  //     throw Exception(
  //         'Failed to fetch dog image for $breedName: ${response2.statusCode}');
  //   }
  // }






}