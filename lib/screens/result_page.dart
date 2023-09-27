import 'package:flutter/material.dart';
import 'package:catlopedia/services/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  final ApiService service2 = ApiService();

  String imageUrl = '';

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
              top: 400,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    'hello',
                    style: TextStyle(
                      fontFamily: 'PT Serif Caption',
                      fontSize: 40.0,
                    ),
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
