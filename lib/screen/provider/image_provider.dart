import 'package:flutter/cupertino.dart';

class Image_Provider extends ChangeNotifier{
int currentImageindex =0;

List Images = [
  "assets/images/img1.jpg",
  "assets/images/img2.jpg",
  "assets/images/img3.jpg",
  "assets/images/img4.jpg",
];

void changeindex(int index)
{
  currentImageindex = index;
  notifyListeners();
}

}