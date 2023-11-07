import 'package:flutter/material.dart';
import 'package:catlopedia/services/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResultPage extends StatefulWidget {
  final String selectedBreed;
  final String selectedReferenceImageId;
  final String selectedImageUrl;

  const ResultPage({Key? key, required this.selectedBreed, required this.selectedReferenceImageId, required this.selectedImageUrl}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  final ApiService service2 = ApiService();

  String catName = '';
  String origin = '';
  String lifespan = '';
  String temperament = '';
  String description = '';
  String imageUrl = '';


  @override
  void initState() {
    super.initState();
    fetchCatOrigin();
    fetchCatLifespan();
    fetchCatTemperament();
    fetchCatDescription();
    fetchCatImage();
  }

  Future<void> fetchCatOrigin() async {
    try {
      final origin = await service2.getOriginForBreed(widget.selectedBreed);
      setState(() {
        this.origin = origin;

      });
    } catch (e) {
      Text('Error fetching the origin.');
    }
  }

  Future<void> fetchCatLifespan() async {
    try {
      final lifespan = await service2.getLifespanForBreed(widget.selectedBreed);
      setState(() {
        this.lifespan = lifespan;

      });
    } catch (e) {
      Text('Error fetching the lifespan.');
    }
  }

  Future<void> fetchCatTemperament() async {
    try {
      final temperament = await service2.getTemperamentForBreed(widget.selectedBreed);
      setState(() {
        this.temperament = temperament;

      });
    } catch (e) {
      Text('Error fetching the temperament.');
    }
  }

  Future<void> fetchCatDescription() async {
    try {
      final description = await service2.getDescriptionForBreed(widget.selectedBreed);
      setState(() {
        this.description = description;

      });
    } catch (e) {
      Text('Error fetching the description.');
    }
  }

  Future<void> fetchCatImage() async {
    try {
      final image = await service2.fetchCatImageByBreed(widget.selectedReferenceImageId);
      setState(() {
        imageUrl = image;

      });
    } catch (e) {
      Text('Error fetching the image.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 420,
                decoration: BoxDecoration(
                  image: imageUrl.isNotEmpty
                      ? DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                      : null, //
                ),
                child: imageUrl
                    .isEmpty
                    ? Center(
                  child: SpinKitCircle(
                    color: Colors.grey,
                    size: 60.0,
                  ),
                )
                    : null,
              ),
            ),
            Positioned(
              top: 360,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.selectedBreed}',
                        style: TextStyle(
                          fontFamily: 'PT Serif Caption',
                          fontSize: 40.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Origin: ', // Display the origin
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$origin', // Display the origin
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lifespan: ', // Display the lifespan
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$lifespan years', // Display the lifespan
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SingleChildScrollView(
                        child: Row(
                          children: [
                            Text(
                              'Temperament: ', // Display the origin
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$temperament', // Display the origin
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Description: $description', // Display the origin
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
