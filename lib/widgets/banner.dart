import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OfferBanner extends StatefulWidget {
  @override
  _OfferBannerState createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage("https://media.istockphoto.com/vectors/rakhi-offer-banner-design-template-vector-id1163952690"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWO_Ez6Lp4SGNTzvdr0Z7luQaVlETlqNIW7w&usqp=CAU"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0Cp5-3xmwVDAZLj4kIPczXBZZ3qxo1A_uQ&usqp=CAU"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //4th Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage('https://media.istockphoto.com/vectors/rakhi-offer-banner-design-template-vector-id1163952690'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //5th Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage('https://media.istockphoto.com/vectors/rakhi-offer-banner-design-template-vector-id1163952690'),
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
