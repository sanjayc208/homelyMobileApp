import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OfferBanner extends StatefulWidget {
  @override
  _OfferBannerState createState() => _OfferBannerState();
}
 var list = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWO_Ez6Lp4SGNTzvdr0Z7luQaVlETlqNIW7w&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0Cp5-3xmwVDAZLj4kIPczXBZZ3qxo1A_uQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2xNbwjsbEYYQKWzddT1Yss1o3HwgtlrO_XT3FZTahruQfrpoFzwxLi1kPYPkQ9v1YsE&usqp=CAU",
            "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-offer-banner-design-template-ef081783b8a58d80662aae948311ef45_screen.jpg?ts=1615117868",
            "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-offer-banner-design-template-ef081783b8a58d80662aae948311ef45_screen.jpg?ts=1615117868"];
class _OfferBannerState extends State<OfferBanner> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:  [for(var item in list ) 
        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(item),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
