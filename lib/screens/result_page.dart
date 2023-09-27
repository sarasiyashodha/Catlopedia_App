import 'package:flutter/material.dart';
import 'package:catlopedia/services/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResultPage extends StatefulWidget {
  final String selectedBreed;
  const ResultPage({Key? key, required this.selectedBreed}) : super(key: key);

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
  }

  Future<void> fetchCatOrigin() async {
    try {
      final origin = await service2.getOriginForBreed(widget.selectedBreed);
      setState(() {
        this.origin = origin;

      });
    } catch (e) {
      Text('Error fetching the image.');
    }
  }

  Future<void> fetchCatLifespan() async {
    try {
      final lifespan = await service2.getLifespanForBreed(widget.selectedBreed);
      setState(() {
        this.lifespan = lifespan;

      });
    } catch (e) {
      Text('Error fetching the image.');
    }
  }

  Future<void> fetchCatTemperament() async {
    try {
      final temperament = await service2.getTemperamentForBreed(widget.selectedBreed);
      setState(() {
        this.temperament = temperament;

      });
    } catch (e) {
      Text('Error fetching the image.');
    }
  }

  Future<void> fetchCatDescription() async {
    try {
      final description = await service2.getDescriptionForBreed(widget.selectedBreed);
      setState(() {
        this.description = description;

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
                      Text(
                        'Origin: $origin', // Display the origin
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Lifespan: $lifespan years', // Display the lifespan
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Temperament: $temperament', // Display the origin
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
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
