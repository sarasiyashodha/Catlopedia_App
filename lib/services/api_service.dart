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

  Future<String> getReferenceImageIdForBreed(String breedName) async {
    try {
      Response response = await get(Uri.parse(catDetails));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        for (dynamic item in body) {
          String name = item['name'] ?? '';
          String referenceImageId = item['reference_image_id'] ?? '';

          if (name.toLowerCase() == breedName.toLowerCase()) {
            return referenceImageId;
          }
        }

        // If the breed name is not found, return an empty string or handle it accordingly
        return '';
      } else {
        throw Exception('Failed to load cat breeds');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> getOriginForBreed(String breedName) async {
    try {
      Response response = await get(Uri.parse(catDetails));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        for (dynamic item in body) {
          String name = item['name'] ?? '';
          String origin = item['origin'] ?? '';

          if (name.toLowerCase() == breedName.toLowerCase()) {
            return origin;
          }
        }

        // If the breed name is not found, return an empty string or handle it accordingly
        return '';
      } else {
        throw Exception('Failed to load cat breeds');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> getLifespanForBreed(String breedName) async {
    try {
      Response response = await get(Uri.parse(catDetails));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        for (dynamic item in body) {
          String name = item['name'] ?? '';
          String lifespan = item['life_span'] ?? '';

          if (name.toLowerCase() == breedName.toLowerCase()) {
            return lifespan;
          }
        }

        // If the breed name is not found, return an empty string or handle it accordingly
        return '';
      } else {
        throw Exception('Failed to load cat breeds');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }











}