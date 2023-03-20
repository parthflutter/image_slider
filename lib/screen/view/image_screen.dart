import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/screen/provider/image_provider.dart';

import 'package:provider/provider.dart';

class image_screen extends StatefulWidget {
  const image_screen({Key? key}) : super(key: key);

  @override
  State<image_screen> createState() => _image_screenState();
}

Image_Provider?image_providert, image_provider;

class _image_screenState extends State<image_screen> {
  @override
  Widget build(BuildContext context) {
    image_providert = Provider.of<Image_Provider>(context, listen: true);
    image_provider = Provider.of<Image_Provider>(context, listen: false);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Image_Slider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    "${image_providert!.Images[index]}",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },

        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 1,
          autoPlayCurve: Curves.easeInCubic,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          initialPage: 2,
          autoPlayInterval: Duration(seconds: 2),
          onPageChanged: (index, reason) {
            image_provider!.changeindex(index);
          },
        ),
      ),
      SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: image_providert!.Images
                .asMap()
                .entries
                .map(
                  (e) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: image_providert!.currentImageindex == e.key
                        ? Colors.black
                        : Colors.black45,
                    shape: BoxShape.circle),
              ),
            )
                .toList(),
          ),
        ],
      ),
    ),
    );
  }
}