import 'package:animations_kit/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class AnimationGallery extends StatefulWidget {
  const AnimationGallery({super.key});

  @override
  State<AnimationGallery> createState() => _AnimationGalleryState();
}

class _AnimationGalleryState extends State<AnimationGallery> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        animationList.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              animationList[index].route,
              arguments: animationList[index].animationBy,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              color: Colors.white12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  animationList[index].name,
                  style: TextStyles.bodyText1(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Image.network(
                    animationList[index].gifPath ?? "",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
      ),
    );
  }
}
