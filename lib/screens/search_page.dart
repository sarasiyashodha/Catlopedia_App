import 'package:flutter/material.dart';
import 'package:catlopedia/services/api_service.dart';
import 'result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService service1 = ApiService();

  List<String> catBreeds = []; //store all the cat breeds that fetch from API.
  List<String> filteredBreeds = [];  //store the cat breeds that are related to the user typed letter in search query.
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final breeds = await service1.getCatBreedNames();
      setState(() {
        catBreeds = breeds; //If successful, it updates the "catBreeds" list in the state.
      });
    } catch (e) {
      Text('Error fetching the dog breed.');
    }
  }

  void filterBreeds() {
    setState(() {
      filteredBreeds = catBreeds
          .where((breed) =>
          breed.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList(); //convert the filtered results back into a list.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'images/cat_image.jpg',
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 16.0, right: 10.0, bottom: 10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    filterBreeds();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Enter a cat breed',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  filled: true,
                  fillColor: Colors.white38,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBreeds.length,
                itemBuilder: (context, index) {
                  final breedName = filteredBreeds[index];
                  return Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border:
                      Border.all(width: 1, color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: Text(breedName),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ResultPage(
                                selectedBreed: breedName,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
