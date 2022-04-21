import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gallery_view/gallery_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }


  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await GalleryView.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo View 408537321'),
        ),
        body: GalleryView(imageUrlList: [
          'assets/image_1.jpg',
          'assets/image_2.jpg',
          'assets/image_3.jpg',
          'assets/image_4.jpg',
          'assets/image_5.jpg',
          'assets/image_6.jpg',
          'assets/image_7.jpg',
          'assets/image_8.jpg',
          ],
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

