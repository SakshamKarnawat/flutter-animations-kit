import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'animation_list.dart';

class AnimationGallery extends StatefulWidget {
  const AnimationGallery({super.key});

  @override
  State<AnimationGallery> createState() => _AnimationGalleryState();
}

class _AnimationGalleryState extends State<AnimationGallery> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    print("a");
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(
        animationList.length,
        (index) => AnimationGalleryItem(index),
      ),
      options: CarouselOptions(
        height: double.maxFinite,
        enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 0.7,
        padEnds: true,
      ),
    );
  }
}

class AnimationGalleryItem extends StatelessWidget {
  final int index;
  const AnimationGalleryItem(
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          animationList[index].route,
          arguments: animationList[index].animationBy,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white12,
        ),
        child: Image.asset(
          animationList[index].gifPath ?? "assets/no_image.png",
          fit: BoxFit.fill,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}
