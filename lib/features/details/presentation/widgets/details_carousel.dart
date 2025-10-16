import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailsCarousel extends StatelessWidget {
  const DetailsCarousel({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 350.0),
      items: [image].map((img) {
        return Builder(
          builder: (context) => Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(img, fit: BoxFit.cover),
          ),
        );
      }).toList(),
    );
  }
}
