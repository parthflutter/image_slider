import 'dart:js';

import 'package:flutter/material.dart';
import 'package:image_slider/screen/provider/image_provider.dart';
import 'package:image_slider/screen/view/image_screen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>Image_Provider(),),
  ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>image_screen(),
      }
    ),
  ),
  );
}