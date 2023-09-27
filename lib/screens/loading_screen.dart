import 'package:catlopedia/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'search_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/cat_logo.jpg'),
              width: 250.0,
            ),
            Text(
              "Catlopedia",
              style: TextStyle(
                fontFamily: 'Bubblegum Sans',
                fontSize: 60.0,
              ),
            ),
            SpinKitCircle(
              color: Colors.grey,
              size: 60.0,
            ),
          ],
        ),
      ),
    );
  }
}
